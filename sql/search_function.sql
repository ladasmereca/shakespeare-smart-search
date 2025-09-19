-- Stored procedure for semantic search in Shakespeare’s works
-- Generates embedding for a query and finds the most similar passages

CREATE OR REPLACE PROCEDURE `shakespeare-smart-search.shakespeare_title_clean.search_shakespeare` (
  query STRING,
  top_k INT64
)
BEGIN
  DECLARE query_embedding ARRAY<FLOAT64>;

  -- Generate embedding for the input query
  SET query_embedding = (
    SELECT ml_generate_embedding_result
    FROM ML.GENERATE_EMBEDDING(
      MODEL `shakespeare-smart-search.shakespeare_title_clean.embed_model`,
      (SELECT query AS content),
      STRUCT(TRUE AS flatten_json_output)
    )
  );

  -- Return top K most similar snippets
  SELECT
    File,
    stanza,
    Genre,
    snippet,
    (
      SELECT SUM(x*y)
      FROM UNNEST(embedding) x WITH OFFSET
      JOIN UNNEST(query_embedding) y WITH OFFSET
      USING (offset)
    ) AS similarity
  FROM `shakespeare-smart-search.shakespeare_title_clean.chunks_with_snippets`
  ORDER BY similarity DESC
  LIMIT top_k;
END;

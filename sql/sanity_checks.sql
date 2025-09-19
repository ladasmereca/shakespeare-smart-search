-- Quick checks to validate data and embeddings

-- Check works_master table schema
SELECT *
FROM `shakespeare-smart-search.shakespeare_title_clean.works_master`
LIMIT 5;

-- Preview chunks
SELECT File, stanza, chunk_text
FROM `shakespeare-smart-search.shakespeare_title_clean.chunks_by_stanza`
LIMIT 5;

-- Verify embeddings exist and dimensions are correct
SELECT File, stanza, snippet, ARRAY_LENGTH(embedding) AS embed_dims
FROM `shakespeare-smart-search.shakespeare_title_clean.chunks_with_snippets`
LIMIT 5;

-- Example query: “revenge”
BEGIN
  DECLARE query_embedding ARRAY<FLOAT64>;

  SET query_embedding = (
    SELECT ml_generate_embedding_result
    FROM ML.GENERATE_EMBEDDING(
      MODEL `shakespeare-smart-search.shakespeare_title_clean.embed_model`,
      (SELECT "revenge" AS content),
      STRUCT(TRUE AS flatten_json_output)
    )
  );

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
  LIMIT 10;
END;

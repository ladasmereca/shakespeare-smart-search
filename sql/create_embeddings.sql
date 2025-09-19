-- Create embeddings for Shakespeare stanzas
-- Using Gemini embeddings in BigQuery AI

CREATE OR REPLACE MODEL `shakespeare-smart-search.shakespeare_title_clean.embed_model`
REMOTE WITH CONNECTION `eu.vertex_ai_shakespeare`
OPTIONS (ENDPOINT = 'gemini-embedding-001');

-- Generate embeddings for text chunks
CREATE OR REPLACE TABLE `shakespeare-smart-search.shakespeare_title_clean.chunks_with_snippets` AS
SELECT
  t.File,
  t.stanza,
  t.Genre,
  t.chunk_text,
  SUBSTR(t.chunk_text, 1, 200) AS snippet,
  s.ml_generate_embedding_result AS embedding
FROM `shakespeare-smart-search.shakespeare_title_clean.chunks_by_stanza` AS t,
ML.GENERATE_EMBEDDING(
  MODEL `shakespeare-smart-search.shakespeare_title_clean.embed_model`,
  (SELECT chunk_text AS content),
  STRUCT(TRUE AS flatten_json_output)
) AS s;

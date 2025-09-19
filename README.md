# Semantic Shakespeare: Exploring Love, Betrayal, and Blood with BigQuery AI

This project was built for the [BigQuery AI Hackathon 2025](https://kaggle.com/competitions/bigquery-ai-hackathon).  
It uses **BigQuery AI’s semantic embeddings (Gemini)** to explore Shakespeare’s works — moving beyond keyword search to reveal deeper thematic connections.

---

## ✨ Project Goals
- Demonstrate semantic search across Shakespeare’s plays, sonnets, and poems.
- Compare thematic elements (e.g., love, betrayal, honor, blood).
- Show how embeddings connect works by *meaning*, not just literal word overlap.

---

## Dataset
- Base: [nrennie/shakespeare](https://github.com/nrennie/shakespeare) (CSV of plays, poems, sonnets).  
- Processed and combined into BigQuery dataset:  
  `shakespeare-smart-search.shakespeare_title_clean.works_master` (available to download [here](https://github.com/ladasmereca/shakespeare-smart-search/tree/main/data)).

---

## Tools & Methods
- **BigQuery AI**:
  - `ML.GENERATE_EMBEDDING` with `gemini-embedding-001`.
  - Vector similarity search via SQL.
- **Colab Notebook** for experimentation and demos.
- **SQL** to preprocess, chunk text, and create embeddings tables.

---

## Results
Specific queries that were tested include:
- **“love and betrayal”** → found passages of infidelity and false vows across sonnets and Lucrece.
- **“honor”** → surfaced Falstaff mocking honor vs. Henry IV glorifying it.
- **“blood”** → linked Macbeth imagery with Lucrece, showing genre crossover.

Embeddings clustered related passages even when exact words were missing.

---

## Repo Structure
- `data/` – Notes on dataset sources.
- `notebooks/` – Jupyter/Colab notebook with full workflow.
- `python/` - Code used to combine the dataset.
- `sql/` – Reusable SQL queries (embedding generation, search).

---

## Limitations
- Metadata (play title, character names) not yet joined into search results.
- No user-facing interface; queries run directly in SQL.
- Similarity scores may look “low” (0.56–0.64) but are meaningful in relative ranking.

---

## Next Steps
- Join embeddings back to metadata for richer results.
- Build a lightweight UI for query input.
- Explore clustering & visualization for thematic grouping.

---

## Acknowledgments
- Data: [nrennie/shakespeare](https://github.com/nrennie/shakespeare) - _essential to the project and very well made_
- Embeddings guide: [Google Generative AI Samples](https://github.com/GoogleCloudPlatform/generative-ai) - _without it the project would have been abandoned_
- Big thank you and shoutout to:
  - **Mom**, _for supporting me no matter what_
  - **Terin**, _for being the best friend I don't deserve but really need_
  - **Yorguss**, _for taking care of me regardless_
  - **Sonny81**, _for making me laugh to the point of crying_
  - **Minnie**, _for not eating the laptop cable, __yet___

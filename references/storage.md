## Storage

Most data is stored in [PostgreSQL](https://www.postgresql.org/docs/).  The
relational database is accessed using
[SQLModel](https://sqlmodel.tiangolo.com/tutorial/) on top of
[SQLAlchemy](https://docs.sqlalchemy.org/) and
[asyncpg](https://magicstack.github.io/asyncpg/).

Blobs are stored in [SeaweedFS](https://github.com/seaweedfs/seaweedfs).

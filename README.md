\# 🏠 Estate Management Database Project



\## 📘 Overview  

This project was developed as the \*\*final project for the Relational Database Design (RBD)\*\* course.  

It models a \*\*real estate management system\*\* that stores information about agents, owners, properties, listings, inquiries, viewings, contracts and payments. The delivery includes:



\- Database schema (DDL) in `ddl.sql`  

\- Sample data inserts (DML) in `dml.sql`  

\- Example analysis \& reporting queries in `queries.sql`  

\- A visual schema diagram `schema.png` (ERD)  



This repository demonstrates practical SQL skills (Oracle-style SQL was used): schema design, referential integrity, data population, and typical business reporting queries.



---



\## 🧩 Sample Data Included (high level)

The `dml.sql` file contains a small dataset used for testing and demonstration. Example entities inserted:



\- \*\*Agents\*\*: 2 sample agents (e.g. Marek Zielinski, Katarzyna Lewandowska)  

\- \*\*Owners\*\*: 2 sample property owners  

\- \*\*Properties\*\*: 2 properties (addresses in Warsaw)  

\- \*\*Listing\*\*: 2 listings (rent and sale)  

\- \*\*Agent\_Assigments\*\*: assignments that link agents to listings  

\- \*\*Amenitity / Property\_amenities\*\*: amenities like Balcony, Elevator, Parking and mappings to properties  

\- \*\*Property\_photos\*\*: sample photo URLs and descriptions  

\- \*\*User\*\*: 2 users (tenant/buyer) — note: table named `"User"` (quoted because USER can be reserved)  

\- \*\*Inquiry, Viewing, Contract, Payment\*\*: example workflow from inquiry → viewing → contract → payment



The small dataset allows running analytics queries immediately after loading the schema and data.



---



\## 🧱 Database Structure (tables from `ddl.sql`)

Key tables (names taken from the DDL file):



\- \*\*Agents\*\* — agent contact details  

\- \*\*Agent\_Assigments\*\* — agent ⇄ listing assignments  

\- \*\*Amenitity\*\* — amenity types (note: spelled `Amenitity` in DDL)  

\- \*\*Property\_amenities\*\* — many-to-many mapping between Properties and Amenitities  

\- \*\*Owner\*\* — property owners  

\- \*\*Properties\*\* — property metadata (owner\_id, adress, city, type, size\_sqm)  

\- \*\*Listing\*\* — listing details for properties (type, price, listing\_date, is\_active)  

\- \*\*Inquiry\*\* — user inquiries for listings  

\- \*\*Viewing\*\* — scheduled viewings tied to inquiries  

\- \*\*Contract\*\* — signed contract records (user\_id, properties\_id, start\_date, price)  

\- \*\*Payment\*\* — payments linked to contracts (amount, status)  

\- \*\*Property\_photos\*\* — image URLs for properties  

\- \*\*"User"\*\* — application users (quoted identifier to avoid reserved word conflicts)



\*\*Note:\*\* All FK constraints are defined in `ddl.sql` (the script includes `ALTER TABLE ... ADD CONSTRAINT` statements so run DDL fully before DML).



---



\## 🔎 Queries Provided (`queries.sql`)

The `queries.sql` file contains example SELECT queries grouped by common patterns. These are useful for learning and reporting:



\### WHERE examples

\- Show all active listings  

\- Show all properties in Warsaw  

\- Show properties bigger than 100 sqm (`TO\_NUMBER(SIZE\_SQM) > 100`)  

\- Show only rent listings  

\- Show inquiries with `Pending` status



\### JOIN examples

\- Listing details with property address (JOIN Listing → Properties)  

\- Users and their inquiries (JOIN Inquiry → "User")  

\- Agents with listings they manage (JOIN Agent\_Assigments → Agents → Listing)  

\- Viewings with the requesting user (JOIN Viewing → Inquiry → "User")  

\- Contract payments with contract type (JOIN Payment → Contract)



\### GROUP BY examples

\- Count properties per city  

\- Count users per type (tenant, buyer, etc.)  

\- Count listings per agent (Agent\_Assigments grouped by agents\_id)  

\- Total area per property type (SUM(TO\_NUMBER(SIZE\_SQM)))  

\- Max listing price per property



\### SUBQUERY examples

\- Show the most expensive listing (using `PRICE = (SELECT MAX(PRICE) FROM LISTING)`)  

\- Addresses of properties that have a Balcony (correlated subquery with `PROPERTY\_AMENITIES`)  

\- Correlated subquery example: inquiry with the price of the listing



These queries are written for readability and learning; they can be extended for dashboards or reports.



---



\## ⚙️ How to run (recommended order)

1\. \*\*Open your SQL client\*\* (Oracle SQL Developer, DBeaver configured for Oracle, etc.)  

2\. \*\*Run `ddl.sql`\*\* to create all tables and constraints.  

&nbsp;  - Make sure the script runs without errors (FKs are added via ALTER TABLE statements).  

3\. \*\*Run `dml.sql`\*\* to populate sample data (INSERT statements).  

&nbsp;  - The DML uses `TO\_DATE(..., 'YYYY-MM-DD')` for date values and Oracle numeric types.  

4\. \*\*Run `queries.sql`\*\* to execute the example analytics queries and inspect results.  

5\. Optionally commit transactions if your environment requires (the provided DML ends with `COMMIT;`).



---



\## ⚠️ Notes \& small caveats

\- The DDL and DML were generated/designed for Oracle (`VARCHAR2`, `NUMBER`, `TO\_DATE` etc.). If you want PostgreSQL / MySQL compatibility, change types (`VARCHAR2→VARCHAR`, `NUMBER→NUMERIC`) and date functions accordingly.  

\- Table/column naming: the schema uses `Amenitity` (note spelling). You can rename for clarity if desired (search \& replace in `ddl.sql` + `dml.sql`).  

\- The `User` table is created with quotes (`"User"`) to avoid reserved-word conflicts — when querying, use the quotes exactly as in `ddl.sql` or rename the table to `app\_user` or `users`.  

\- `SIZE\_SQM` stored as text/varchar in this schema — queries use `TO\_NUMBER(SIZE\_SQM)` to perform numeric comparisons. Consider storing numeric area as `NUMBER` if you will do many numeric operations.



---



\## 📁 Files in this repository

\- `ddl.sql` — DDL / schema (CREATE TABLE + FK constraints)  

\- `dml.sql` — sample inserts for testing (INSERT ... ; COMMIT;)  

\- `queries.sql` — example WHERE / JOIN / GROUP BY / SUBQUERY queries for analysis  

\- `schema.png` — ERD / schema diagram image (visual representation)  

\- `README.md` — this documentation



---



\## 👨‍🎓 Author \& attribution

\*\*Fatih Ulucan\*\*  

Relational Database Design (RBD) — Semester Final Project (Polish-Japanese Academy of Information Technology - Warsaw, 2025)



Schema generation note: Portions of the DDL were exported from Vertabelo (metadata comment left at top of `ddl.sql`).






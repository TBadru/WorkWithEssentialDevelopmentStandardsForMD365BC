# Define the different functional table types and characteristics

https://learn.microsoft.com/en-us/training/modules/identify-table-types/

As a business management application, Business Central manages and processes a considerable amount of data, all of which is stored in tables. From a technical perspective, all tables are the same because they all contain fields, keys, and triggers. From a functional perspective, different types of tables exist to serve different purposes.

Understanding the different table types in Business Central helps you to efficiently customize the existing functionality and design new application areas.

The following list describes the most common table types and their characteristics:

Master table - Contains information about the most important entities of a functional area. The primary focus of a functional area would be customers for receivables, vendors for payables, and items for inventory.

Supplemental table - Likely, you'll want to enrich the master data with supplemental data. In supplemental tables, you can store data that is related to countries, such as country code and description. These extra tables are not as important as the master tables, but they provide additional information about the master data records. Examples of supplemental tables are the Currency and Language tables.

Setup table - When you're creating a solution, you'll likely need some configuration for the solution. You can set up the configuration and organize data in a setup table. Examples of setup tables include the G/L Setup and Sales & Receivables Setup tables.

Register table - Functions as a table of contents for its corresponding ledger table(s). It registers historical, transactional kinds of information. Examples of register tables are the G/L Register and Item Register tables.

Subsidiary table - Contains a combination of information from master and/or supplemental tables, like item/vendor information. Examples of subsidiary tables are the Item Vendor and FA Depreciation Book tables.

Ledger table - In ledger tables, you can find the transactional information of a functional domain. Examples of ledger tables are the Cust. Ledger Entry and Item Ledger Entry tables.

Journal table - All transactions are booked through journals, so it's the primary transactional entry. Some examples of journal tables are the Purchase Journal and Item Journal tables.

Document table - When you enter transactions, you'll need documents such as a sales quote and a sales order. Document tables are secondary transactional tables. These tables are always comprised of two tables: a table with the header information and a table with the line details. For example, the Sales Header and Sales Line tables contain information about documents like sales orders and sales quotes.

Document history table - These tables are the historical version of the document tables. When you post documents from the document tables, they will go through a journal table and end up in a document history table. The Sales Invoice Header and Sales Invoice Line tables are examples of document history tables.
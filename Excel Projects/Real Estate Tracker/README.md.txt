# RealEstate Tracker - Greater Sydney Listings (St George + Parramatta)

## 1. Project Overview

This workbook analyzes **96 property listings** across Greater Sydney's St George and Parramatta regions. 
It transforms raw agency exports into a clean, analysis-ready model and delivers a business-focused dashboard for agents, sales leaders, and acquisitions teams.

**Key business questions answered:**
- How are listings distributed by price bands and property type? 
- Which suburbs and agencies dominate new stock? 
- What does the supply mix (beds, baths, parking) look like? 
- Where are there opportunities for targeted campaigns or faster comps? 

---

## 2. At-a-Glance Metrics

| Metric | Value |
|--------------------------|----------------------------------------------------------------------------------------|
| **Total Listings** | 96 |
| **Price Band Volumes** | 0.5M-1M: 25 · 1M-1.5M: 26 · 1.5M-2M: 28 · 2M-2.5M: 9 · 2.5M-3M: 6 · 3M-3.5M: 1 · 3.5M-4M: 1 |
| **Property Types** | House: 49 · Apartment: 37 · Townhouse: 6 · Duplex: 1 · Villa: 1 · Land: 1 · Other: 1 |
| **Avg. Prices by Type** | Apartment ≈ $985k · House ≈ $1.90M · Townhouse ≈ $1.28M · Duplex $1.80M · Villa $1.05M · Land $2.0M · Other $2.65M |
| **Bedrooms (Total/Avg)** | 356 / 3.71 |
| **Bathrooms (Total/Avg)**| 258 / 2.69 |
| **Parking (Total/Avg)** | 192 / 2.00 |
| **Top Suburbs** | Hurstville: 28 · Guildford: 14 · Epping: 6 · Parramatta: 5 |
| **Top Agency** | LJ Hooker (Parramatta) |

---

## 3. Dashboard and Features

The **Dashboard** sheet allows business users to:
- Filter by suburb, agency, property type, or price range using slicers. 
- See average price, volume, and composition by property type. 
- Compare agency performance (listings, avg. price, co-agents). 
- Spot over/under-priced stock vs. suburb averages with conditional formatting. 
- Track time trends via listing date pivots. 
- Export ready-to-share visuals for team meetings or campaign planning. 

---

## 4. Data Pipeline and Excel Techniques

Behind the dashboard:
- **Power Query** → Cleans and ingests raw listings into `Sheet1`. 
- **Price Parsing** → Strips symbols and creates numeric `Price_Clean`. 
- **Normalization** → Maps ranges into `PriceRange` bands. 
- **Standardization** → Deduplicates agent/agency names, aligns property types. 
- **Dynamic Arrays / LET / LAMBDA** → Reusable metrics and error-proof logic. 
- **PivotTables + KPI Cards** → Drive the analytic layer in `Pivot`. 
- **Slicers & Conditional Formatting** → Deliver interactive, guided analysis. 

---

## 5. Insights Snapshot

- **Stock skew** → 83% of listings sit between $0.5M-2.0M, the sweet spot for first-time buyers and investors. 
- **House premium** → Houses average $1.9M, nearly 2× apartment average ($985k). 
- **Agency concentration** → One LJ Hooker group controls >10% of listings (10/96). 
- **Suburb hotspots** → Hurstville alone contributes 29% of supply (28/96). 
- **Co-agent networks** → Repeated pairs (e.g., Linda Yu & Daniel Yang; Karl Flaifel & George Boghos) hint at structured collaboration. 
- **Parking impact** → Median of 2 spaces per property highlights car dependency in target suburbs. 

---

## 6. How to Use & Repo Structure

**Download:** Clone repo and open `RealEstate Tracker.xlsx`. 

**Sheets:**
- `Sheet1` - Raw listings 
- `Pivot` - Analytic pivots and calculations 
- `Dashboard` - User-facing charts and KPIs 

**Workflow:**
- **Refresh:** Use *Data > Refresh All* to reload Power Query pipelines. 
- **Interact:** Use slicers to drill down by suburb, property type, or agency. 

---

## 7. Why This Matters

**Outcome for stakeholders:**
- **Sales leaders** → Target campaigns at high-volume suburbs and price bands. 
- **Agents** → Benchmark performance against peers and suburbs. 
- **Acquisitions teams** → Identify gaps in stock mix and negotiate smarter. 

**As a candidate:** 
This project shows I can take messy real estate data, engineer it into a scalable Excel model, and surface business-critical insights with clarity and impact.
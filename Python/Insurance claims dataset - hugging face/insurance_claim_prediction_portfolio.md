# Insurance Claim Cost Prediction & Risk Segmentation Portfolio

This project focuses on analyzing, cleaning, engineering features, and modeling healthcare insurance data to predict claim costs. It also segments customers into risk categories for financial impact and pricing strategy analysis.

## 🚀 Project Overview

- **Objective**: Clean raw clinical and demographic logs, perform exploratory data analysis (EDA), engineer representative risk features, and build highly accurate predictive models to estimate insurance claim predictions.
- **Dataset Source**: `mgchavez/insurance-charge-mlops-logs` (Hugging Face Hub).
- **Key Achievements**:
  - Developed a comprehensive automated data-quality pipeline.
  - Built a Predictive Linear Regression Model with **R² Score > 99.9%** on the validation set.
  - Implemented a Random Forest Regressor and applied **SHAP (SHapley Additive exPlanations)** to interpret model predictions and explain global feature importance.
  - Structured a financial risk-group strategy that segmented customers into Low, Medium, and High-risk buckets.

---

## 🛠️ Tech Stack & Libraries

- **Languages**: Python
- **Libraries**: Pandas, NumPy, Scikit-Learn, SHAP, Matplotlib, Datasets (Hugging Face)

---

## 📊 Step-by-Step Implementation

### 1. Data Ingestion & Quality Assessment
- Imported and loaded raw dataset logs using Hugging Face's `datasets` library.
- Created an automated validation suite `check_data_quality()` to check for `NaN` values, verify structural bounds (e.g., age within $0-64$, BMI ranges), validate categorical variables, and detect potential engineered feature discrepancies.

### 2. Robust Data Cleaning
- **Missing Values**: Handled missing numeric fields (`age`, `bmi`, `prediction`) using robust median imputation, and initialized `children` defaults to `0`.
- **Categorical Integrity**: Cleaned invalid records for `sex` and `smoker` by mapping anomalous entries into standard values and grouping unexpected strings under an `'unknown'` flag.
- **Range Clipping**: Clipped physical bounds (e.g., maximum child limit set to 10; BMI within standard 10–60 scales).

### 3. Feature Engineering
- **Binning & Segmentation**:
  - Grouped continuous age distributions into logical demographic brackets (`age_bucket` ranging from Child to Mature).
  - Segmented BMI scores into standard clinical metrics (Underweight, Normal, Overweight, Obese).
- **Categorical Encoding**:
  - Transformed binary attributes like `sex` and `smoker` into binary integers (`is_male`, `is_smoker`).
  - Implemented ordinal encoding for regions (`region_bucket`).

### 4. Key Exploratory Insights & Visualizations
- **Smoking Status**: The single highest driver of claim costs. Average cost for smokers was **~$32,307** compared to non-smokers at **~$8,122**.
- **BMI & Claims Correlation**: Positive correlation ($~0.24$) showing escalating costs among Obese individuals.

#### Visualizing BMI Impact:
![BMI vs Predicted Claim Cost](bmi_vs_cost.png)

- **Risk Segmentations**: Mature age groups (55-64) combined with an 'Obese' classification and a smoking habit represented the absolute highest risk segment with mean predictions peaking around **~$39,793**.

### 5. Advanced Machine Learning & Interpretability
- **Supervised Models**: Fitted Linear Regression and Random Forest Regressors to predict the continuous `prediction` value.
- **Performance**: High fidelity alignment with true targets achieving extremely low test error ($R^2$ of **0.999**).
- **SHAP Analysis**: Used Kernel/Tree SHAP explanations to confirm that `is_smoker` and `age` represent the most influential contributors toward model decisions.

#### Visualizing Feature Importance via SHAP:
![SHAP Summary Plot](shap_summary.png)

---

## 📈 Business & Financial Impact

1. **Risk Tier Pricing**: Segmented the demographic base into `Low` (Mean: $3.7k), `Medium` (Mean: $10.0k), and `High` (Mean: $25.3k) risk tiers to enable targeted premium underwriting.
2. **Revenue Adjustment Modeling**: Evaluated the financial impact of adjusting High-Risk premiums by $10\%$, demonstrating an estimated **$2.27 Million** potential pricing optimization window based on the overall portfolio scale.

---

## 🔮 Future Directions: How to Improve This Project

To elevate this project further for production environments or a highly competitive portfolio, several expansion avenues can be explored:

### 1. Data Enrichment (External Data Needs)
- **Medical History & Pre-existing Conditions**: Incorporate clinical history (e.g., family history of cardiovascular disease, chronic illnesses like diabetes or hypertension) to drastically improve prediction fidelity for non-smokers.
- **Granular Lifestyle Diagnostics**: Collect details on alcohol consumption, physical exercise hours per week, sleep quality metrics, and stress indicators.
- **Geographical & Socioeconomic Factors**: Merge postal codes with local environmental indices (pollution levels, average altitude, local healthcare costs, or density of medical infrastructure).

### 2. Methodological Improvements
- **Unsupervised Anomaly Detection**: Implement algorithms like Isolation Forests to detect fraudulent or highly atypical claim records.
- **Advanced Estimators**: Benchmark performance against state-of-the-art gradient boosting frameworks such as XGBoost, LightGBM, and CatBoost.
- **Hyperparameter Optimization**: Incorporate Optuna or Bayesian search strategies to systematically optimize model parameters.
- **MLOps Deployment**: Containerize the pipeline using Docker and establish CI/CD training workflows with MLflow or Weights & Biases to track model lineage, metrics, and data drift over time.

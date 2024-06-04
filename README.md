# Coffee Data Analysis using Regression

This repository contains two main files: a Jupyter notebook for linear regression analysis and an R script for data analysis related to coffee. The purpose of this repository is to demonstrate different data analysis techniques using Python and R.

## Table of Contents

- [Files](#files)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Files

### 1. `L_regression.ipynb`
This Jupyter notebook covers the process of performing a linear regression analysis. The notebook includes sections on data loading, preprocessing, exploratory data analysis (EDA), model training, evaluation, and visualization.

### 2. `With_Coffe.R`
This R script performs data analysis related to coffee. It includes data loading, preprocessing, exploratory data analysis, and visualization.

## Prerequisites

To run the files in this repository, you will need the following:

- **Python 3.6 or higher** (for the Jupyter notebook)
- **R** (for the R script)
- **Jupyter Notebook or JupyterLab** (for the Jupyter notebook)
- Required Python libraries (listed in the `requirements.txt` file)
- Required R libraries (listed in the `With_Coffe.R` script)

## Installation

### Python and Jupyter Notebook

1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/your-username/linear-regression-coffee-analysis.git
    cd linear-regression-coffee-analysis
    ```

2. Create a virtual environment (optional but recommended):
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

3. Install the required Python libraries:
    ```bash
    pip install -r requirements.txt
    ```

### R

1. Make sure you have R installed on your system. You can download it from [CRAN](https://cran.r-project.org/).

2. Install the required R libraries listed at the beginning of the `With_Coffe.R` script:
    ```R
    install.packages(c("dplyr", "ggplot2", "readr"))
    ```

## Usage

### Running the Jupyter Notebook

1. Start Jupyter Notebook or JupyterLab:
    ```bash
    jupyter notebook
    # or
    jupyter lab
    ```

2. Open the `L_regression.ipynb` notebook.

3. Run the cells in the notebook sequentially to perform the linear regression analysis.

### Running the R Script

1. Open RStudio or your preferred R IDE.

2. Load and run the `With_Coffe.R` script:
    ```R
    source("With_Coffe.R")
    ```

## Contributers
- Ziad Elharairi

## License
This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License.
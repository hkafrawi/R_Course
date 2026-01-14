{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "517dc311",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2026-01-14T10:51:12.059715Z",
     "iopub.status.busy": "2026-01-14T10:51:12.057636Z",
     "iopub.status.idle": "2026-01-14T10:51:13.411794Z",
     "shell.execute_reply": "2026-01-14T10:51:13.410046Z"
    },
    "papermill": {
     "duration": 1.361872,
     "end_time": "2026-01-14T10:51:13.414189",
     "exception": false,
     "start_time": "2026-01-14T10:51:12.052317",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'tutorial-wages'"
      ],
      "text/latex": [
       "'tutorial-wages'"
      ],
      "text/markdown": [
       "'tutorial-wages'"
      ],
      "text/plain": [
       "[1] \"tutorial-wages\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "71dcaa06",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:51:13.453086Z",
     "iopub.status.busy": "2026-01-14T10:51:13.422497Z",
     "iopub.status.idle": "2026-01-14T10:51:45.919557Z",
     "shell.execute_reply": "2026-01-14T10:51:45.917794Z"
    },
    "papermill": {
     "duration": 32.50476,
     "end_time": "2026-01-14T10:51:45.922167",
     "exception": false,
     "start_time": "2026-01-14T10:51:13.417407",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"readxl\")\n",
    "library(readxl)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "44a9cb70",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:51:45.932133Z",
     "iopub.status.busy": "2026-01-14T10:51:45.930514Z",
     "iopub.status.idle": "2026-01-14T10:51:46.075839Z",
     "shell.execute_reply": "2026-01-14T10:51:46.074090Z"
    },
    "papermill": {
     "duration": 0.152654,
     "end_time": "2026-01-14T10:51:46.078224",
     "exception": false,
     "start_time": "2026-01-14T10:51:45.925570",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>exp</th><th scope=col>wks</th><th scope=col>ms</th><th scope=col>fem</th><th scope=col>union</th><th scope=col>ed</th><th scope=col>lwage</th><th scope=col>id</th><th scope=col>t</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>6</td><td>39</td><td>1</td><td>0</td><td>0</td><td>9</td><td>5.99645</td><td>1</td><td>4</td></tr>\n",
       "\t<tr><td>8</td><td>35</td><td>1</td><td>0</td><td>0</td><td>9</td><td>6.17379</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>4</td><td>43</td><td>1</td><td>0</td><td>0</td><td>9</td><td>5.72031</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><td>7</td><td>42</td><td>1</td><td>0</td><td>0</td><td>9</td><td>6.06146</td><td>1</td><td>5</td></tr>\n",
       "\t<tr><td>9</td><td>32</td><td>1</td><td>0</td><td>0</td><td>9</td><td>6.24417</td><td>1</td><td>7</td></tr>\n",
       "\t<tr><td>5</td><td>40</td><td>1</td><td>0</td><td>0</td><td>9</td><td>5.99645</td><td>1</td><td>3</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " exp & wks & ms & fem & union & ed & lwage & id & t\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 6 & 39 & 1 & 0 & 0 & 9 & 5.99645 & 1 & 4\\\\\n",
       "\t 8 & 35 & 1 & 0 & 0 & 9 & 6.17379 & 1 & 6\\\\\n",
       "\t 4 & 43 & 1 & 0 & 0 & 9 & 5.72031 & 1 & 2\\\\\n",
       "\t 7 & 42 & 1 & 0 & 0 & 9 & 6.06146 & 1 & 5\\\\\n",
       "\t 9 & 32 & 1 & 0 & 0 & 9 & 6.24417 & 1 & 7\\\\\n",
       "\t 5 & 40 & 1 & 0 & 0 & 9 & 5.99645 & 1 & 3\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 9\n",
       "\n",
       "| exp &lt;dbl&gt; | wks &lt;dbl&gt; | ms &lt;dbl&gt; | fem &lt;dbl&gt; | union &lt;dbl&gt; | ed &lt;dbl&gt; | lwage &lt;dbl&gt; | id &lt;dbl&gt; | t &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 6 | 39 | 1 | 0 | 0 | 9 | 5.99645 | 1 | 4 |\n",
       "| 8 | 35 | 1 | 0 | 0 | 9 | 6.17379 | 1 | 6 |\n",
       "| 4 | 43 | 1 | 0 | 0 | 9 | 5.72031 | 1 | 2 |\n",
       "| 7 | 42 | 1 | 0 | 0 | 9 | 6.06146 | 1 | 5 |\n",
       "| 9 | 32 | 1 | 0 | 0 | 9 | 6.24417 | 1 | 7 |\n",
       "| 5 | 40 | 1 | 0 | 0 | 9 | 5.99645 | 1 | 3 |\n",
       "\n"
      ],
      "text/plain": [
       "  exp wks ms fem union ed lwage   id t\n",
       "1 6   39  1  0   0     9  5.99645 1  4\n",
       "2 8   35  1  0   0     9  6.17379 1  6\n",
       "3 4   43  1  0   0     9  5.72031 1  2\n",
       "4 7   42  1  0   0     9  6.06146 1  5\n",
       "5 9   32  1  0   0     9  6.24417 1  7\n",
       "6 5   40  1  0   0     9  5.99645 1  3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df <- read_xlsx(\"/kaggle/input/tutorial-wages/wages.xlsx\", sheet = \"Tabelle1\")\n",
    "head(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "9c140df6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:51:46.088204Z",
     "iopub.status.busy": "2026-01-14T10:51:46.086654Z",
     "iopub.status.idle": "2026-01-14T10:52:07.790408Z",
     "shell.execute_reply": "2026-01-14T10:52:07.788409Z"
    },
    "papermill": {
     "duration": 21.712338,
     "end_time": "2026-01-14T10:52:07.793914",
     "exception": false,
     "start_time": "2026-01-14T10:51:46.081576",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘plm’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    between, lag, lead\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"plm\")\n",
    "library(\"plm\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "0ea52898",
   "metadata": {
    "_kg_hide-input": true,
    "execution": {
     "iopub.execute_input": "2026-01-14T10:52:07.807637Z",
     "iopub.status.busy": "2026-01-14T10:52:07.804411Z",
     "iopub.status.idle": "2026-01-14T10:52:08.248712Z",
     "shell.execute_reply": "2026-01-14T10:52:08.245073Z"
    },
    "papermill": {
     "duration": 0.45383,
     "end_time": "2026-01-14T10:52:08.252149",
     "exception": false,
     "start_time": "2026-01-14T10:52:07.798319",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "?plm"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "27b9ecce",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:52:08.262511Z",
     "iopub.status.busy": "2026-01-14T10:52:08.261011Z",
     "iopub.status.idle": "2026-01-14T10:52:08.318963Z",
     "shell.execute_reply": "2026-01-14T10:52:08.316558Z"
    },
    "papermill": {
     "duration": 0.066029,
     "end_time": "2026-01-14T10:52:08.321731",
     "exception": false,
     "start_time": "2026-01-14T10:52:08.255702",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A pdata.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>exp</th><th scope=col>wks</th><th scope=col>ms</th><th scope=col>fem</th><th scope=col>union</th><th scope=col>ed</th><th scope=col>lwage</th><th scope=col>id</th><th scope=col>t</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1-1</th><td>3</td><td>32</td><td>1</td><td>0</td><td>0</td><td>9</td><td>5.56068</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>1-2</th><td>4</td><td>43</td><td>1</td><td>0</td><td>0</td><td>9</td><td>5.72031</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>1-3</th><td>5</td><td>40</td><td>1</td><td>0</td><td>0</td><td>9</td><td>5.99645</td><td>1</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>1-4</th><td>6</td><td>39</td><td>1</td><td>0</td><td>0</td><td>9</td><td>5.99645</td><td>1</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>1-5</th><td>7</td><td>42</td><td>1</td><td>0</td><td>0</td><td>9</td><td>6.06146</td><td>1</td><td>5</td></tr>\n",
       "\t<tr><th scope=row>1-6</th><td>8</td><td>35</td><td>1</td><td>0</td><td>0</td><td>9</td><td>6.17379</td><td>1</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A pdata.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & exp & wks & ms & fem & union & ed & lwage & id & t\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <fct>\\\\\n",
       "\\hline\n",
       "\t1-1 & 3 & 32 & 1 & 0 & 0 & 9 & 5.56068 & 1 & 1\\\\\n",
       "\t1-2 & 4 & 43 & 1 & 0 & 0 & 9 & 5.72031 & 1 & 2\\\\\n",
       "\t1-3 & 5 & 40 & 1 & 0 & 0 & 9 & 5.99645 & 1 & 3\\\\\n",
       "\t1-4 & 6 & 39 & 1 & 0 & 0 & 9 & 5.99645 & 1 & 4\\\\\n",
       "\t1-5 & 7 & 42 & 1 & 0 & 0 & 9 & 6.06146 & 1 & 5\\\\\n",
       "\t1-6 & 8 & 35 & 1 & 0 & 0 & 9 & 6.17379 & 1 & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A pdata.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | exp &lt;dbl&gt; | wks &lt;dbl&gt; | ms &lt;dbl&gt; | fem &lt;dbl&gt; | union &lt;dbl&gt; | ed &lt;dbl&gt; | lwage &lt;dbl&gt; | id &lt;fct&gt; | t &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1-1 | 3 | 32 | 1 | 0 | 0 | 9 | 5.56068 | 1 | 1 |\n",
       "| 1-2 | 4 | 43 | 1 | 0 | 0 | 9 | 5.72031 | 1 | 2 |\n",
       "| 1-3 | 5 | 40 | 1 | 0 | 0 | 9 | 5.99645 | 1 | 3 |\n",
       "| 1-4 | 6 | 39 | 1 | 0 | 0 | 9 | 5.99645 | 1 | 4 |\n",
       "| 1-5 | 7 | 42 | 1 | 0 | 0 | 9 | 6.06146 | 1 | 5 |\n",
       "| 1-6 | 8 | 35 | 1 | 0 | 0 | 9 | 6.17379 | 1 | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "    exp wks ms fem union ed lwage   id t\n",
       "1-1 3   32  1  0   0     9  5.56068 1  1\n",
       "1-2 4   43  1  0   0     9  5.72031 1  2\n",
       "1-3 5   40  1  0   0     9  5.99645 1  3\n",
       "1-4 6   39  1  0   0     9  5.99645 1  4\n",
       "1-5 7   42  1  0   0     9  6.06146 1  5\n",
       "1-6 8   35  1  0   0     9  6.17379 1  6"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "panel_data <- pdata.frame(df, index = c(\"id\", \"t\"))\n",
    "head(panel_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "37687c64",
   "metadata": {
    "papermill": {
     "duration": 0.003495,
     "end_time": "2026-01-14T10:52:08.328816",
     "exception": false,
     "start_time": "2026-01-14T10:52:08.325321",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## A\n",
    "- **Time-Variant**: Years of Experience(exp) , Weeks Worked (wks), Union Contract(union)\n",
    "- **Time-Invariant**: Martial Status(ms), Gender(fem), Years of Education(ed)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "c7fd66b4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:52:08.339398Z",
     "iopub.status.busy": "2026-01-14T10:52:08.337836Z",
     "iopub.status.idle": "2026-01-14T10:52:08.444555Z",
     "shell.execute_reply": "2026-01-14T10:52:08.441667Z"
    },
    "papermill": {
     "duration": 0.116943,
     "end_time": "2026-01-14T10:52:08.449228",
     "exception": false,
     "start_time": "2026-01-14T10:52:08.332285",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Pooling Model\n",
       "\n",
       "Call:\n",
       "plm(formula = formula, data = panel_data, model = \"pooling\")\n",
       "\n",
       "Balanced Panel: n = 595, T = 7, N = 4165\n",
       "\n",
       "Residuals:\n",
       "      Min.    1st Qu.     Median    3rd Qu.       Max. \n",
       "-2.1871831 -0.2366288  0.0011037  0.2462934  1.9727256 \n",
       "\n",
       "Coefficients:\n",
       "               Estimate  Std. Error  t-value  Pr(>|t|)    \n",
       "(Intercept)  5.10413167  0.06873798  74.2549 < 2.2e-16 ***\n",
       "exp          0.01175693  0.00054851  21.4341 < 2.2e-16 ***\n",
       "wks          0.00564138  0.00115009   4.9052 9.691e-07 ***\n",
       "ms           0.06821535  0.02174840   3.1366  0.001721 ** \n",
       "fem         -0.35155517  0.02655895 -13.2368 < 2.2e-16 ***\n",
       "union        0.09388641  0.01277659   7.3483 2.404e-13 ***\n",
       "ed           0.07976193  0.00221103  36.0745 < 2.2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    886.9\n",
       "Residual Sum of Squares: 578.62\n",
       "R-Squared:      0.3476\n",
       "Adj. R-Squared: 0.34666\n",
       "F-statistic: 369.231 on 6 and 4158 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "            Length Class  Mode     \n",
       "statistic   1      -none- numeric  \n",
       "p.value     1      -none- numeric  \n",
       "method      1      -none- character\n",
       "parameter   1      -none- numeric  \n",
       "data.name   1      -none- character\n",
       "alternative 1      -none- character"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Pooled OLS Model\n",
    "formula <- lwage ~ exp + wks + ms + fem + union + ed\n",
    "pooled <- plm(formula, data=panel_data, model = \"pooling\")\n",
    "test1 <- plmtest(pooled, type = \"bp\")\n",
    "summary(pooled)\n",
    "summary(test1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "e39afb2e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:52:08.469498Z",
     "iopub.status.busy": "2026-01-14T10:52:08.466779Z",
     "iopub.status.idle": "2026-01-14T10:52:08.580082Z",
     "shell.execute_reply": "2026-01-14T10:52:08.574428Z"
    },
    "papermill": {
     "duration": 0.128595,
     "end_time": "2026-01-14T10:52:08.585090",
     "exception": false,
     "start_time": "2026-01-14T10:52:08.456495",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Within Model\n",
       "\n",
       "Call:\n",
       "plm(formula = formula, data = panel_data, model = \"within\")\n",
       "\n",
       "Balanced Panel: n = 595, T = 7, N = 4165\n",
       "\n",
       "Residuals:\n",
       "      Min.    1st Qu.     Median    3rd Qu.       Max. \n",
       "-1.7981900 -0.0539564  0.0039106  0.0626168  1.9452223 \n",
       "\n",
       "Coefficients:\n",
       "        Estimate Std. Error t-value Pr(>|t|)    \n",
       "exp    0.0968250  0.0011889 81.4379  < 2e-16 ***\n",
       "wks    0.0011122  0.0006032  1.8439  0.06529 .  \n",
       "ms    -0.0328118  0.0190949 -1.7184  0.08582 .  \n",
       "union  0.0311041  0.0149251  2.0840  0.03723 *  \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    240.65\n",
       "Residual Sum of Squares: 83.859\n",
       "R-Squared:      0.65153\n",
       "Adj. R-Squared: 0.5931\n",
       "F-statistic: 1666.84 on 4 and 3566 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Fixed OLS Model\n",
    "formula <- lwage ~ exp + wks + ms + fem + union + ed\n",
    "fixed <- plm(formula, data=panel_data, model = \"within\")\n",
    "summary(fixed)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "34b63ecc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:52:08.607747Z",
     "iopub.status.busy": "2026-01-14T10:52:08.602933Z",
     "iopub.status.idle": "2026-01-14T10:52:08.780470Z",
     "shell.execute_reply": "2026-01-14T10:52:08.777249Z"
    },
    "papermill": {
     "duration": 0.192899,
     "end_time": "2026-01-14T10:52:08.785623",
     "exception": false,
     "start_time": "2026-01-14T10:52:08.592724",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Random Effect Model \n",
       "   (Swamy-Arora's transformation)\n",
       "\n",
       "Call:\n",
       "plm(formula = formula, data = panel_data, model = \"random\")\n",
       "\n",
       "Balanced Panel: n = 595, T = 7, N = 4165\n",
       "\n",
       "Effects:\n",
       "                  var std.dev share\n",
       "idiosyncratic 0.02352 0.15335 0.217\n",
       "individual    0.08507 0.29167 0.783\n",
       "theta: 0.8051\n",
       "\n",
       "Residuals:\n",
       "     Min.   1st Qu.    Median   3rd Qu.      Max. \n",
       "-2.043665 -0.115641  0.001359  0.118523  2.070265 \n",
       "\n",
       "Coefficients:\n",
       "               Estimate  Std. Error z-value  Pr(>|z|)    \n",
       "(Intercept)  4.20718544  0.09339429 45.0476 < 2.2e-16 ***\n",
       "exp          0.05202244  0.00107671 48.3163 < 2.2e-16 ***\n",
       "wks          0.00151159  0.00077028  1.9624  0.049717 *  \n",
       "ms          -0.07069352  0.02314599 -3.0542  0.002256 ** \n",
       "fem         -0.35799031  0.05413921 -6.6124 3.781e-11 ***\n",
       "union        0.05594056  0.01706799  3.2775  0.001047 ** \n",
       "ed           0.11234250  0.00578786 19.4100 < 2.2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    265.2\n",
       "Residual Sum of Squares: 163.73\n",
       "R-Squared:      0.38264\n",
       "Adj. R-Squared: 0.38175\n",
       "Chisq: 2577.12 on 6 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Random OLS Model\n",
    "formula <- lwage ~ exp + wks + ms + fem + union + ed\n",
    "random <- plm(formula, data=panel_data, model = \"random\")\n",
    "summary(random)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "f4baf8e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-14T10:52:08.809263Z",
     "iopub.status.busy": "2026-01-14T10:52:08.804307Z",
     "iopub.status.idle": "2026-01-14T10:52:08.844499Z",
     "shell.execute_reply": "2026-01-14T10:52:08.838807Z"
    },
    "papermill": {
     "duration": 0.056542,
     "end_time": "2026-01-14T10:52:08.849958",
     "exception": false,
     "start_time": "2026-01-14T10:52:08.793416",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tHausman Test\n",
       "\n",
       "data:  formula\n",
       "chisq = 7718.5, df = 4, p-value < 2.2e-16\n",
       "alternative hypothesis: one model is inconsistent\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "hausmann_test <- phtest(fixed,random)\n",
    "hausmann_test"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 9257851,
     "sourceId": 14494768,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 60.125066,
   "end_time": "2026-01-14T10:52:08.983339",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2026-01-14T10:51:08.858273",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

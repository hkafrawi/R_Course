{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "b3aa9bee",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2026-02-01T20:08:00.570322Z",
     "iopub.status.busy": "2026-02-01T20:08:00.567858Z",
     "iopub.status.idle": "2026-02-01T20:08:01.770179Z",
     "shell.execute_reply": "2026-02-01T20:08:01.768275Z"
    },
    "papermill": {
     "duration": 1.214672,
     "end_time": "2026-02-01T20:08:01.773336",
     "exception": false,
     "start_time": "2026-02-01T20:08:00.558664",
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
       "'sun-flower-dataset'"
      ],
      "text/latex": [
       "'sun-flower-dataset'"
      ],
      "text/markdown": [
       "'sun-flower-dataset'"
      ],
      "text/plain": [
       "[1] \"sun-flower-dataset\""
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
   "id": "3670daf4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:08:01.818895Z",
     "iopub.status.busy": "2026-02-01T20:08:01.787220Z",
     "iopub.status.idle": "2026-02-01T20:15:06.449997Z",
     "shell.execute_reply": "2026-02-01T20:15:06.447747Z"
    },
    "papermill": {
     "duration": 424.674025,
     "end_time": "2026-02-01T20:15:06.453450",
     "exception": false,
     "start_time": "2026-02-01T20:08:01.779425",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: magrittr\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘magrittr’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    set_names\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:tidyr’:\n",
      "\n",
      "    extract\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: frontier\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :\n",
      "“there is no package called ‘frontier’”\n"
     ]
    },
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
      "also installing the dependency ‘micEcon’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: micEcon\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "If you have questions, suggestions, or comments regarding one of the 'micEcon' packages, please use a forum or 'tracker' at micEcon's R-Forge site:\n",
      "https://r-forge.r-project.org/projects/micecon/\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: lmtest\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: zoo\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘zoo’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    as.Date, as.Date.numeric\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Please cite the 'frontier' package as:\n",
      "Tim Coelli and Arne Henningsen (2013). frontier: Stochastic Frontier Analysis. R package version 1.1. http://CRAN.R-Project.org/package=frontier.\n",
      "\n",
      "If you have questions, suggestions, or comments regarding the 'frontier' package, please use a forum or 'tracker' at frontier's R-Forge site:\n",
      "https://r-forge.r-project.org/projects/frontier/\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: car\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: carData\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘car’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    recode\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    some\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: sfaR\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :\n",
      "“there is no package called ‘sfaR’”\n"
     ]
    },
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
      "also installing the dependencies ‘hpa’, ‘mnorm’, ‘trustOptim’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "           ****           *******  \n",
      "          /**/           /**////** \n",
      "  ****** ******  ******  /**   /** \n",
      " **//// ///**/  //////** /*******  \n",
      "//*****   /**    ******* /**///**  \n",
      " /////**  /**   **////** /**  //** \n",
      " ******   /**  //********/**   //**\n",
      "//////    //    //////// //     //    version 1.0.1\n",
      "\n",
      "* Please cite the 'sfaR' package as:\n",
      "  Dakpo KH., Desjeux Y., Henningsen A., and Latruffe L. (2024). sfaR: Stochastic Frontier Analysis Using R. R package version 1.0.1.\n",
      "\n",
      "See also: citation(\"sfaR\")\n",
      "\n",
      "* For any questions, suggestions, or comments on the 'sfaR' package, you can contact directly the authors or visit:  https://github.com/hdakpo/sfaR/issues\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘sfaR’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:frontier’:\n",
      "\n",
      "    efficiencies\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "#check if all packages are installed\n",
    "packages <- c(\n",
    "  \"tidyverse\",\n",
    "  \"magrittr\",\n",
    "  \"frontier\",\n",
    "  \"lmtest\",\n",
    "  \"car\",\n",
    "  \"sfaR\"\n",
    ")\n",
    "for (pkg in packages) {\n",
    "  if (!require(pkg, character.only = TRUE)) {\n",
    "    install.packages(pkg, dependencies = TRUE)\n",
    "    library(pkg, character.only = TRUE)\n",
    "  }\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "251f2dbd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.498144Z",
     "iopub.status.busy": "2026-02-01T20:15:06.496112Z",
     "iopub.status.idle": "2026-02-01T20:15:06.519319Z",
     "shell.execute_reply": "2026-02-01T20:15:06.517194Z"
    },
    "papermill": {
     "duration": 0.060396,
     "end_time": "2026-02-01T20:15:06.522174",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.461778",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#load needed libraries\n",
    "library(tidyverse)\n",
    "library(magrittr)\n",
    "library(frontier)\n",
    "library(lmtest)\n",
    "library(car)\n",
    "library(sfaR)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "4ccb816b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.541189Z",
     "iopub.status.busy": "2026-02-01T20:15:06.539550Z",
     "iopub.status.idle": "2026-02-01T20:15:06.581166Z",
     "shell.execute_reply": "2026-02-01T20:15:06.579190Z"
    },
    "papermill": {
     "duration": 0.054068,
     "end_time": "2026-02-01T20:15:06.583758",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.529690",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "############\n",
    "#Exercise 1.\n",
    "############\n",
    "#1a. Load the data SunFlower using the function readRDS()\n",
    "############\n",
    "df <- readRDS(\"/kaggle/input/sun-flower-dataset/dataSunFlower.RDS\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "fdb79275",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.602649Z",
     "iopub.status.busy": "2026-02-01T20:15:06.600966Z",
     "iopub.status.idle": "2026-02-01T20:15:06.635817Z",
     "shell.execute_reply": "2026-02-01T20:15:06.633977Z"
    },
    "papermill": {
     "duration": 0.046951,
     "end_time": "2026-02-01T20:15:06.638247",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.591296",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Total_prod</th><th scope=col>Land</th><th scope=col>Capital</th><th scope=col>Labor</th><th scope=col>Fertilizer</th><th scope=col>Age</th><th scope=col>Age2</th><th scope=col>Edu</th><th scope=col>Experience</th><th scope=col>region</th><th scope=col>gender</th><th scope=col>policy</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>2063</th><td>19137.36</td><td>1580.41</td><td>44.83</td><td>46722</td><td> 409</td><td>39</td><td>1528</td><td>14</td><td>17</td><td>Reg1</td><td>Female</td><td>No Support      </td></tr>\n",
       "\t<tr><th scope=row>2469</th><td> 9647.53</td><td> 526.17</td><td>18.70</td><td> 8497</td><td>1148</td><td>36</td><td>1322</td><td>13</td><td>14</td><td>Reg2</td><td>Female</td><td>Received Support</td></tr>\n",
       "\t<tr><th scope=row>1186</th><td>22276.53</td><td>1173.32</td><td>55.34</td><td> 2162</td><td>1032</td><td>32</td><td>1026</td><td> 0</td><td>13</td><td>Reg1</td><td>Male  </td><td>No Support      </td></tr>\n",
       "\t<tr><th scope=row>1919</th><td>11527.88</td><td>1429.52</td><td>17.65</td><td>21607</td><td> 683</td><td>40</td><td>1586</td><td> 9</td><td> 1</td><td>Reg1</td><td>Male  </td><td>No Support      </td></tr>\n",
       "\t<tr><th scope=row>1319</th><td>21168.72</td><td> 897.93</td><td>42.62</td><td>30681</td><td>2868</td><td>28</td><td> 780</td><td> 9</td><td> 2</td><td>Reg1</td><td>Male  </td><td>No Support      </td></tr>\n",
       "\t<tr><th scope=row>729</th><td>29290.92</td><td>2050.17</td><td>41.33</td><td>18485</td><td>5086</td><td>39</td><td>1528</td><td>13</td><td> 1</td><td>Reg2</td><td>Female</td><td>No Support      </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 12\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & Total\\_prod & Land & Capital & Labor & Fertilizer & Age & Age2 & Edu & Experience & region & gender & policy\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <fct> & <fct>\\\\\n",
       "\\hline\n",
       "\t2063 & 19137.36 & 1580.41 & 44.83 & 46722 &  409 & 39 & 1528 & 14 & 17 & Reg1 & Female & No Support      \\\\\n",
       "\t2469 &  9647.53 &  526.17 & 18.70 &  8497 & 1148 & 36 & 1322 & 13 & 14 & Reg2 & Female & Received Support\\\\\n",
       "\t1186 & 22276.53 & 1173.32 & 55.34 &  2162 & 1032 & 32 & 1026 &  0 & 13 & Reg1 & Male   & No Support      \\\\\n",
       "\t1919 & 11527.88 & 1429.52 & 17.65 & 21607 &  683 & 40 & 1586 &  9 &  1 & Reg1 & Male   & No Support      \\\\\n",
       "\t1319 & 21168.72 &  897.93 & 42.62 & 30681 & 2868 & 28 &  780 &  9 &  2 & Reg1 & Male   & No Support      \\\\\n",
       "\t729 & 29290.92 & 2050.17 & 41.33 & 18485 & 5086 & 39 & 1528 & 13 &  1 & Reg2 & Female & No Support      \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 12\n",
       "\n",
       "| <!--/--> | Total_prod &lt;dbl&gt; | Land &lt;dbl&gt; | Capital &lt;dbl&gt; | Labor &lt;dbl&gt; | Fertilizer &lt;dbl&gt; | Age &lt;dbl&gt; | Age2 &lt;dbl&gt; | Edu &lt;dbl&gt; | Experience &lt;dbl&gt; | region &lt;fct&gt; | gender &lt;fct&gt; | policy &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 2063 | 19137.36 | 1580.41 | 44.83 | 46722 |  409 | 39 | 1528 | 14 | 17 | Reg1 | Female | No Support       |\n",
       "| 2469 |  9647.53 |  526.17 | 18.70 |  8497 | 1148 | 36 | 1322 | 13 | 14 | Reg2 | Female | Received Support |\n",
       "| 1186 | 22276.53 | 1173.32 | 55.34 |  2162 | 1032 | 32 | 1026 |  0 | 13 | Reg1 | Male   | No Support       |\n",
       "| 1919 | 11527.88 | 1429.52 | 17.65 | 21607 |  683 | 40 | 1586 |  9 |  1 | Reg1 | Male   | No Support       |\n",
       "| 1319 | 21168.72 |  897.93 | 42.62 | 30681 | 2868 | 28 |  780 |  9 |  2 | Reg1 | Male   | No Support       |\n",
       "| 729 | 29290.92 | 2050.17 | 41.33 | 18485 | 5086 | 39 | 1528 | 13 |  1 | Reg2 | Female | No Support       |\n",
       "\n"
      ],
      "text/plain": [
       "     Total_prod Land    Capital Labor Fertilizer Age Age2 Edu Experience region\n",
       "2063 19137.36   1580.41 44.83   46722  409       39  1528 14  17         Reg1  \n",
       "2469  9647.53    526.17 18.70    8497 1148       36  1322 13  14         Reg2  \n",
       "1186 22276.53   1173.32 55.34    2162 1032       32  1026  0  13         Reg1  \n",
       "1919 11527.88   1429.52 17.65   21607  683       40  1586  9   1         Reg1  \n",
       "1319 21168.72    897.93 42.62   30681 2868       28   780  9   2         Reg1  \n",
       "729  29290.92   2050.17 41.33   18485 5086       39  1528 13   1         Reg2  \n",
       "     gender policy          \n",
       "2063 Female No Support      \n",
       "2469 Female Received Support\n",
       "1186 Male   No Support      \n",
       "1919 Male   No Support      \n",
       "1319 Male   No Support      \n",
       "729  Female No Support      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "471921e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.658195Z",
     "iopub.status.busy": "2026-02-01T20:15:06.656549Z",
     "iopub.status.idle": "2026-02-01T20:15:06.707454Z",
     "shell.execute_reply": "2026-02-01T20:15:06.705421Z"
    },
    "papermill": {
     "duration": 0.064499,
     "end_time": "2026-02-01T20:15:06.710744",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.646245",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "############\n",
    "#1b. Fit a linear production function.\n",
    "############\n",
    "df %<>%\n",
    "  rename(qt = Total_prod,\n",
    "         lnd = Land,\n",
    "         cap = Capital,\n",
    "         lab = Labor,\n",
    "         fert = Fertilizer) %>%\n",
    "  mutate_at(vars(qt, lnd, cap, lab, fert),\n",
    "            list(ln = ~log(. / mean(.)))) %>%\n",
    "  mutate_at(vars(lnd_ln, cap_ln, lab_ln, fert_ln),\n",
    "            list(sq = ~0.5 * (.)^2)) %>%\n",
    "  mutate(\n",
    "    ld_lb = lnd_ln * lab_ln,\n",
    "    ld_cap = lnd_ln * cap_ln,\n",
    "    ld_fert = lnd_ln * fert_ln,\n",
    "    cap_lab = cap_ln * lab_ln,\n",
    "    cap_fert = cap_ln * fert_ln,\n",
    "    lb_fert = lab_ln * fert_ln\n",
    "  )"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "8784b51e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.730110Z",
     "iopub.status.busy": "2026-02-01T20:15:06.728550Z",
     "iopub.status.idle": "2026-02-01T20:15:06.768706Z",
     "shell.execute_reply": "2026-02-01T20:15:06.766386Z"
    },
    "papermill": {
     "duration": 0.053403,
     "end_time": "2026-02-01T20:15:06.771733",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.718330",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = formula_linear, data = df)\n",
       "\n",
       "Residuals:\n",
       "     Min       1Q   Median       3Q      Max \n",
       "-30734.2  -2483.1    133.1   2509.7  29824.4 \n",
       "\n",
       "Coefficients:\n",
       "              Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept) -1.624e+03  4.146e+02  -3.916 9.73e-05 ***\n",
       "lnd          8.744e+00  6.085e-01  14.372  < 2e-16 ***\n",
       "cap          2.560e+02  9.309e+00  27.504  < 2e-16 ***\n",
       "lab          1.265e-01  1.913e-02   6.614 6.76e-11 ***\n",
       "fert         6.262e-02  1.721e-01   0.364    0.716    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 5612 on 821 degrees of freedom\n",
       "Multiple R-squared:  0.8268,\tAdjusted R-squared:  0.826 \n",
       "F-statistic:   980 on 4 and 821 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "##Linear production function\n",
    "formula_linear <- qt ~ lnd + cap + lab + fert\n",
    "\n",
    "l_model <- lm(formula_linear, data = df)\n",
    "summary(l_model)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "99b7e4e8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.791119Z",
     "iopub.status.busy": "2026-02-01T20:15:06.789525Z",
     "iopub.status.idle": "2026-02-01T20:15:06.822122Z",
     "shell.execute_reply": "2026-02-01T20:15:06.820328Z"
    },
    "papermill": {
     "duration": 0.045782,
     "end_time": "2026-02-01T20:15:06.825425",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.779643",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Coub-Douglas production function\n",
    "formula_CD <- qt_ln ~ lnd_ln + cap_ln + lab_ln + fert_ln\n",
    "\n",
    "#Translog production function\n",
    "formula_TL <- qt_ln ~ lnd_ln + cap_ln + lab_ln + fert_ln +\n",
    "  lnd_ln_sq + cap_ln_sq + lab_ln_sq + fert_ln_sq +\n",
    "  ld_lb + ld_cap + ld_fert +\n",
    "  cap_lab + cap_fert + lb_fert\n",
    "\n",
    "# Alternative:\n",
    "formula_TL_two <- qt_ln ~ lnd_ln + cap_ln + lab_ln + fert_ln +\n",
    "  I(0.5*lnd_ln^2) + I(0.5*cap_ln^2) +\n",
    "  I(0.5*lab_ln^2) + I(0.5*fert_ln^2) +\n",
    "  I(lnd_ln*cap_ln) + I(lnd_ln*lab_ln) +\n",
    "  I(lnd_ln*fert_ln) + I(cap_ln*lab_ln) +\n",
    "  I(cap_ln*fert_ln) + I(lab_ln*fert_ln)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "b8103467",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.844784Z",
     "iopub.status.busy": "2026-02-01T20:15:06.843067Z",
     "iopub.status.idle": "2026-02-01T20:15:06.867800Z",
     "shell.execute_reply": "2026-02-01T20:15:06.865534Z"
    },
    "papermill": {
     "duration": 0.037386,
     "end_time": "2026-02-01T20:15:06.870717",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.833331",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       " Length   Class    Mode \n",
       "      3 formula    call "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "l_model <- lm(formula_TL_two, data = df)\n",
    "summary(formula_TL_two)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "fd3bce37",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.890269Z",
     "iopub.status.busy": "2026-02-01T20:15:06.888675Z",
     "iopub.status.idle": "2026-02-01T20:15:06.913975Z",
     "shell.execute_reply": "2026-02-01T20:15:06.911666Z"
    },
    "papermill": {
     "duration": 0.038514,
     "end_time": "2026-02-01T20:15:06.917111",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.878597",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = formula_CD, data = df)\n",
       "\n",
       "Residuals:\n",
       "     Min       1Q   Median       3Q      Max \n",
       "-2.38872 -0.10974  0.04616  0.18957  0.62031 \n",
       "\n",
       "Coefficients:\n",
       "             Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept) 0.0004727  0.0128761   0.037    0.971    \n",
       "lnd_ln      0.5509144  0.0327284  16.833  < 2e-16 ***\n",
       "cap_ln      0.4393168  0.0170318  25.794  < 2e-16 ***\n",
       "lab_ln      0.0912204  0.0158371   5.760 1.19e-08 ***\n",
       "fert_ln     0.0110998  0.0130245   0.852    0.394    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 0.3238 on 821 degrees of freedom\n",
       "Multiple R-squared:  0.8394,\tAdjusted R-squared:  0.8386 \n",
       "F-statistic:  1072 on 4 and 821 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "############\n",
    "#1c. Fit a Cobb-Douglas production function.\n",
    "############\n",
    "CD_model <- lm(formula_CD, data = df)\n",
    "summary(CD_model)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0143cfeb",
   "metadata": {
    "papermill": {
     "duration": 0.007889,
     "end_time": "2026-02-01T20:15:06.932939",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.925050",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "############\n",
    "#d. Interpret the elasticity coefficients\n",
    "############\n",
    "\n",
    "- each coefficient represents the percentage change in output in 1% change in that input, holding other inputs constant\n",
    "- Increasing RTS since the sum of all changes is more than one meaning increasing inputs by a variable will increase output by more than that variable "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "69dfaebe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.952440Z",
     "iopub.status.busy": "2026-02-01T20:15:06.950876Z",
     "iopub.status.idle": "2026-02-01T20:15:06.972782Z",
     "shell.execute_reply": "2026-02-01T20:15:06.970962Z"
    },
    "papermill": {
     "duration": 0.034812,
     "end_time": "2026-02-01T20:15:06.975740",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.940928",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1.09255132838982"
      ],
      "text/latex": [
       "1.09255132838982"
      ],
      "text/markdown": [
       "1.09255132838982"
      ],
      "text/plain": [
       "[1] 1.092551"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "############\n",
    "#1e. Compute the returns to scale of the production frontier and test for constant\n",
    "#return to scale. \n",
    "#What does the value indicate? Is it increasing, decreasing, or constant returns\n",
    "#to scale\n",
    "############\n",
    "partialelast <- coef(CD_model)[2:5] #(sum of elasticities)\n",
    "sum(partialelast)\n",
    "\n",
    "#Returns to scale ≈ 1.09 (sum of elasticities)\n",
    "# 0.551 + 0.439 + 0.091 + 0.011 ≈ 1.092, indicating slightly increasing returns to scale."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "13c1787a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:06.996142Z",
     "iopub.status.busy": "2026-02-01T20:15:06.994524Z",
     "iopub.status.idle": "2026-02-01T20:15:07.031782Z",
     "shell.execute_reply": "2026-02-01T20:15:07.029805Z"
    },
    "papermill": {
     "duration": 0.050828,
     "end_time": "2026-02-01T20:15:07.034799",
     "exception": false,
     "start_time": "2026-02-01T20:15:06.983971",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A anova: 2 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Res.Df</th><th scope=col>RSS</th><th scope=col>Df</th><th scope=col>Sum of Sq</th><th scope=col>F</th><th scope=col>Pr(&gt;F)</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>822</td><td>88.78328</td><td>NA</td><td>      NA</td><td>      NA</td><td>          NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>821</td><td>86.09374</td><td> 1</td><td>2.689542</td><td>25.64779</td><td>5.062165e-07</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A anova: 2 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & Res.Df & RSS & Df & Sum of Sq & F & Pr(>F)\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 822 & 88.78328 & NA &       NA &       NA &           NA\\\\\n",
       "\t2 & 821 & 86.09374 &  1 & 2.689542 & 25.64779 & 5.062165e-07\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A anova: 2 × 6\n",
       "\n",
       "| <!--/--> | Res.Df &lt;dbl&gt; | RSS &lt;dbl&gt; | Df &lt;dbl&gt; | Sum of Sq &lt;dbl&gt; | F &lt;dbl&gt; | Pr(&gt;F) &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | 822 | 88.78328 | NA |       NA |       NA |           NA |\n",
       "| 2 | 821 | 86.09374 |  1 | 2.689542 | 25.64779 | 5.062165e-07 |\n",
       "\n"
      ],
      "text/plain": [
       "  Res.Df RSS      Df Sum of Sq F        Pr(>F)      \n",
       "1 822    88.78328 NA       NA        NA           NA\n",
       "2 821    86.09374  1 2.689542  25.64779 5.062165e-07"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "linearHypothesis(CD_model,\n",
    "                 \"lnd_ln + cap_ln + lab_ln + fert_ln = 1\")\n",
    "\n",
    "#p-value is far below 0.01:\n",
    "#reject the null hypothesis of constant returns to scale."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "1838b796",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:07.054949Z",
     "iopub.status.busy": "2026-02-01T20:15:07.053371Z",
     "iopub.status.idle": "2026-02-01T20:15:07.066737Z",
     "shell.execute_reply": "2026-02-01T20:15:07.065015Z"
    },
    "papermill": {
     "duration": 0.026758,
     "end_time": "2026-02-01T20:15:07.069827",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.043069",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "############\n",
    "#Exercise 2.\n",
    "############\n",
    "#2a. Fit a Cobb-Douglas production frontier using the sfacross( ) function from the\n",
    "#sfaR package.\n",
    "###########"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "093e2809",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:07.090635Z",
     "iopub.status.busy": "2026-02-01T20:15:07.089049Z",
     "iopub.status.idle": "2026-02-01T20:15:07.240434Z",
     "shell.execute_reply": "2026-02-01T20:15:07.237781Z"
    },
    "papermill": {
     "duration": 0.166371,
     "end_time": "2026-02-01T20:15:07.244595",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.078224",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "-------------------------------------------------------------------------------- \n",
       "Normal-Half Normal SF Model \n",
       "Dependent Variable:                                                        qt_ln \n",
       "Log likelihood solver:                                         BFGS maximization \n",
       "Log likelihood iter:                                                         102 \n",
       "Log likelihood value:                                                 -128.00176 \n",
       "Log likelihood gradient norm:                                        1.40273e-05 \n",
       "Estimation based on:                                         N =  826 and K =  7 \n",
       "Inf. Cr:                                           AIC  =  270.0 AIC/N  =  0.327 \n",
       "                                                   BIC  =  303.0 BIC/N  =  0.367 \n",
       "                                                   HQIC =  282.7 HQIC/N =  0.342 \n",
       "-------------------------------------------------------------------------------- \n",
       "Variances: Sigma-squared(v)   =                                          0.01350 \n",
       "           Sigma(v)           =                                          0.01350 \n",
       "           Sigma-squared(u)   =                                          0.21520 \n",
       "           Sigma(u)           =                                          0.21520 \n",
       "Sigma = Sqrt[(s^2(u)+s^2(v))] =                                          0.47823 \n",
       "Gamma = sigma(u)^2/sigma^2    =                                          0.94096 \n",
       "Lambda = sigma(u)/sigma(v)    =                                          3.99206 \n",
       "Var[u]/{Var[u]+Var[v]}        =                                          0.85275 \n",
       "-------------------------------------------------------------------------------- \n",
       "Average inefficiency E[ui]     =                                         0.37014 \n",
       "Average efficiency E[exp(-ui)] =                                         0.71574 \n",
       "-------------------------------------------------------------------------------- \n",
       "Stochastic Production/Profit Frontier, e = v - u \n",
       "-----[ Tests vs. No Inefficiency ]-----\n",
       "Likelihood Ratio Test of Inefficiency\n",
       "Deg. freedom for inefficiency model                                            1 \n",
       "Log Likelihood for OLS Log(H0) =                                      -238.18494 \n",
       "LR statistic:  \n",
       "Chisq = 2*[LogL(H0)-LogL(H1)]  =                                       220.36635 \n",
       "Kodde-Palm C*:       95%: 2.70554                                   99%: 5.41189 \n",
       "Coelli (1995) skewness test on OLS residuals\n",
       "M3T: z                         =                                       -28.28133 \n",
       "M3T: p.value                   =                                         0.00000 \n",
       "Final maximum likelihood estimates \n",
       "-------------------------------------------------------------------------------- \n",
       "                         Deterministic Component of SFA \n",
       "-------------------------------------------------------------------------------- \n",
       "               Coefficient Std. Error z value Pr(>|z|)    \n",
       "(Intercept)        0.35356    0.01367 25.8735  < 2e-16 ***\n",
       "lnd_ln             0.50590    0.02571 19.6759  < 2e-16 ***\n",
       "cap_ln             0.43823    0.01293 33.8868  < 2e-16 ***\n",
       "lab_ln             0.10437    0.01231  8.4761  < 2e-16 ***\n",
       "fert_ln            0.01956    0.01048  1.8654  0.06212 .  \n",
       "-------------------------------------------------------------------------------- \n",
       "                  Parameter in variance of u (one-sided error) \n",
       "-------------------------------------------------------------------------------- \n",
       "               Coefficient Std. Error z value  Pr(>|z|)    \n",
       "Zu_(Intercept)    -1.53618    0.07134 -21.532 < 2.2e-16 ***\n",
       "-------------------------------------------------------------------------------- \n",
       "                 Parameters in variance of v (two-sided error) \n",
       "-------------------------------------------------------------------------------- \n",
       "               Coefficient Std. Error z value  Pr(>|z|)    \n",
       "Zv_(Intercept)    -4.30479    0.17209 -25.015 < 2.2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "-------------------------------------------------------------------------------- \n",
       "Model was estimated on : Feb Sun 01, 2026 at 20:15 \n",
       "Log likelihood status: successful convergence  \n",
       "-------------------------------------------------------------------------------- "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sfa_cd <- sfacross(\n",
    "   formula = qt_ln ~ lnd_ln + cap_ln + lab_ln + fert_ln,\n",
    "   data = df,\n",
    "   udist = \"hnormal\", # half-normal inefficiency\n",
    "   S = 1L # production frontier: epsilon = v - u\n",
    "   )\n",
    "\n",
    "summary(sfa_cd)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7f1a8a9c",
   "metadata": {
    "papermill": {
     "duration": 0.013412,
     "end_time": "2026-02-01T20:15:07.271591",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.258179",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- Gama Value close to 1 indicating that variance is due to inefficiency"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "b01bb137",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:07.303172Z",
     "iopub.status.busy": "2026-02-01T20:15:07.300934Z",
     "iopub.status.idle": "2026-02-01T20:15:07.429478Z",
     "shell.execute_reply": "2026-02-01T20:15:07.426937Z"
    },
    "papermill": {
     "duration": 0.148267,
     "end_time": "2026-02-01T20:15:07.433271",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.285004",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Error Components Frontier (see Battese & Coelli 1992)\n",
       "Inefficiency decreases the endogenous variable (as in a production function)\n",
       "The dependent variable is logged\n",
       "Iterative ML estimation terminated after 11 iterations:\n",
       "log likelihood values and parameters of two successive iterations\n",
       "are within the tolerance limit\n",
       "\n",
       "final maximum likelihood estimates\n",
       "              Estimate Std. Error z value  Pr(>|z|)    \n",
       "(Intercept)  0.3535630  0.0136686 25.8669 < 2.2e-16 ***\n",
       "lnd_ln       0.5058959  0.0257019 19.6832 < 2.2e-16 ***\n",
       "cap_ln       0.4382344  0.0130534 33.5725 < 2.2e-16 ***\n",
       "lab_ln       0.1043688  0.0122687  8.5069 < 2.2e-16 ***\n",
       "fert_ln      0.0195589  0.0104500  1.8717   0.06125 .  \n",
       "sigmaSq      0.2287077  0.0145813 15.6850 < 2.2e-16 ***\n",
       "gamma        0.9409565  0.0119989 78.4204 < 2.2e-16 ***\n",
       "sigmaSqU     0.2152040  0.0155074 13.8775 < 2.2e-16 ***\n",
       "sigmaSqV     0.0135037  0.0023382  5.7753 7.681e-09 ***\n",
       "sigma        0.4782339  0.0152449 31.3701 < 2.2e-16 ***\n",
       "sigmaU       0.4639008  0.0167141 27.7550 < 2.2e-16 ***\n",
       "sigmaV       0.1162055  0.0100605 11.5506 < 2.2e-16 ***\n",
       "lambdaSq    15.9366549  3.4418791  4.6302 3.653e-06 ***\n",
       "lambda       3.9920740  0.4310891  9.2604 < 2.2e-16 ***\n",
       "varU         0.0782009         NA      NA        NA    \n",
       "sdU          0.2796442         NA      NA        NA    \n",
       "gammaVar     0.8527477         NA      NA        NA    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "log likelihood value: -128.0017 \n",
       "\n",
       "cross-sectional data\n",
       "total number of observations = 826 \n",
       "\n",
       "mean efficiency: 0.7294659 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Alternatively:\n",
    "CD_model_SFA <- sfa(formula_CD,\n",
    "                    data = df)\n",
    "summary(CD_model_SFA, extraPar = T)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "cd24cfc3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:07.466332Z",
     "iopub.status.busy": "2026-02-01T20:15:07.464093Z",
     "iopub.status.idle": "2026-02-01T20:15:07.484764Z",
     "shell.execute_reply": "2026-02-01T20:15:07.482095Z"
    },
    "papermill": {
     "duration": 0.042247,
     "end_time": "2026-02-01T20:15:07.489014",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.446767",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "############\n",
    "#2b. Use a likelihood ratio test to compare the Cobb-Douglas frontier model with OLS.\n",
    "#Interpret the result in the context of its Null hypothesis.\n",
    "############\n",
    "\n",
    "# lrtest(sfa_cd)\n",
    "# lrtest(CD_model_SFA)\n",
    "\n",
    "# compares:\n",
    "#Model 1 (Null): OLS model → no inefficiency term\n",
    "#Model 2 (Alternative): Stochastic Frontier → includes inefficiency + noise\n",
    "\n",
    "#p-value is  small, far below 0.001.\n",
    "#Reject the null hypothesis that inefficiency = 0\n",
    "#SFA (Cobb–Douglas frontier) fits stat, significantly better than OLS. \n",
    "#The frontier model is clearly preferred.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7bcde974",
   "metadata": {
    "papermill": {
     "duration": 0.013371,
     "end_time": "2026-02-01T20:15:07.516483",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.503112",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "############\n",
    "#2c. What is the value of Gamma and variance of Gamma? What does it mean?\n",
    "############\n",
    "\n",
    "a term between 0 and 1 indicating whether the variance is due to noise or ineffcieincy. close to 1 means inefficienecy and close to 0 is due to noise "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "0a57edee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:07.537973Z",
     "iopub.status.busy": "2026-02-01T20:15:07.536372Z",
     "iopub.status.idle": "2026-02-01T20:15:07.564285Z",
     "shell.execute_reply": "2026-02-01T20:15:07.561988Z"
    },
    "papermill": {
     "duration": 0.041747,
     "end_time": "2026-02-01T20:15:07.567513",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.525766",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "-------------------------------------------------------------------------------- \n",
       "Normal-Half Normal SF Model \n",
       "Dependent Variable:                                                        qt_ln \n",
       "Log likelihood solver:                                         BFGS maximization \n",
       "Log likelihood iter:                                                         102 \n",
       "Log likelihood value:                                                 -128.00176 \n",
       "Log likelihood gradient norm:                                        1.40273e-05 \n",
       "Estimation based on:                                         N =  826 and K =  7 \n",
       "Inf. Cr:                                           AIC  =  270.0 AIC/N  =  0.327 \n",
       "                                                   BIC  =  303.0 BIC/N  =  0.367 \n",
       "                                                   HQIC =  282.7 HQIC/N =  0.342 \n",
       "-------------------------------------------------------------------------------- \n",
       "Variances: Sigma-squared(v)   =                                          0.01350 \n",
       "           Sigma(v)           =                                          0.01350 \n",
       "           Sigma-squared(u)   =                                          0.21520 \n",
       "           Sigma(u)           =                                          0.21520 \n",
       "Sigma = Sqrt[(s^2(u)+s^2(v))] =                                          0.47823 \n",
       "Gamma = sigma(u)^2/sigma^2    =                                          0.94096 \n",
       "Lambda = sigma(u)/sigma(v)    =                                          3.99206 \n",
       "Var[u]/{Var[u]+Var[v]}        =                                          0.85275 \n",
       "-------------------------------------------------------------------------------- \n",
       "Average inefficiency E[ui]     =                                         0.37014 \n",
       "Average efficiency E[exp(-ui)] =                                         0.71574 \n",
       "-------------------------------------------------------------------------------- \n",
       "Stochastic Production/Profit Frontier, e = v - u \n",
       "-----[ Tests vs. No Inefficiency ]-----\n",
       "Likelihood Ratio Test of Inefficiency\n",
       "Deg. freedom for inefficiency model                                            1 \n",
       "Log Likelihood for OLS Log(H0) =                                      -238.18494 \n",
       "LR statistic:  \n",
       "Chisq = 2*[LogL(H0)-LogL(H1)]  =                                       220.36635 \n",
       "Kodde-Palm C*:       95%: 2.70554                                   99%: 5.41189 \n",
       "Coelli (1995) skewness test on OLS residuals\n",
       "M3T: z                         =                                       -28.28133 \n",
       "M3T: p.value                   =                                         0.00000 \n",
       "Final maximum likelihood estimates \n",
       "-------------------------------------------------------------------------------- \n",
       "                         Deterministic Component of SFA \n",
       "-------------------------------------------------------------------------------- \n",
       "               Coefficient Std. Error z value Pr(>|z|)    \n",
       "(Intercept)        0.35356    0.01367 25.8735  < 2e-16 ***\n",
       "lnd_ln             0.50590    0.02571 19.6759  < 2e-16 ***\n",
       "cap_ln             0.43823    0.01293 33.8868  < 2e-16 ***\n",
       "lab_ln             0.10437    0.01231  8.4761  < 2e-16 ***\n",
       "fert_ln            0.01956    0.01048  1.8654  0.06212 .  \n",
       "-------------------------------------------------------------------------------- \n",
       "                  Parameter in variance of u (one-sided error) \n",
       "-------------------------------------------------------------------------------- \n",
       "               Coefficient Std. Error z value  Pr(>|z|)    \n",
       "Zu_(Intercept)    -1.53618    0.07134 -21.532 < 2.2e-16 ***\n",
       "-------------------------------------------------------------------------------- \n",
       "                 Parameters in variance of v (two-sided error) \n",
       "-------------------------------------------------------------------------------- \n",
       "               Coefficient Std. Error z value  Pr(>|z|)    \n",
       "Zv_(Intercept)    -4.30479    0.17209 -25.015 < 2.2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "-------------------------------------------------------------------------------- \n",
       "Model was estimated on : Feb Sun 01, 2026 at 20:15 \n",
       "Log likelihood status: successful convergence  \n",
       "-------------------------------------------------------------------------------- "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "############\n",
    "#2d. Interpret the mean technical efficiency score.\n",
    "############\n",
    "summary(sfa_cd)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a457a3bd",
   "metadata": {
    "papermill": {
     "duration": 0.011811,
     "end_time": "2026-02-01T20:15:07.590450",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.578639",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Average efficiency E[exp(-ui)] = 0.71574 \n",
    "\n",
    "The 0.71574 being close to 1 means theyre off by 1-0.71574 to prefomring on maximum feasible output. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "165958e8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:07.617346Z",
     "iopub.status.busy": "2026-02-01T20:15:07.615006Z",
     "iopub.status.idle": "2026-02-01T20:15:07.671171Z",
     "shell.execute_reply": "2026-02-01T20:15:07.668777Z"
    },
    "papermill": {
     "duration": 0.073588,
     "end_time": "2026-02-01T20:15:07.674851",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.601263",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 6 × 1 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>efficiency</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>2063</th><td>0.5058871</td></tr>\n",
       "\t<tr><th scope=row>2469</th><td>0.7445443</td></tr>\n",
       "\t<tr><th scope=row>1186</th><td>0.8116348</td></tr>\n",
       "\t<tr><th scope=row>1919</th><td>0.5168802</td></tr>\n",
       "\t<tr><th scope=row>1319</th><td>0.7462408</td></tr>\n",
       "\t<tr><th scope=row>729</th><td>0.7208654</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 6 × 1 of type dbl\n",
       "\\begin{tabular}{r|l}\n",
       "  & efficiency\\\\\n",
       "\\hline\n",
       "\t2063 & 0.5058871\\\\\n",
       "\t2469 & 0.7445443\\\\\n",
       "\t1186 & 0.8116348\\\\\n",
       "\t1919 & 0.5168802\\\\\n",
       "\t1319 & 0.7462408\\\\\n",
       "\t729 & 0.7208654\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 6 × 1 of type dbl\n",
       "\n",
       "| <!--/--> | efficiency |\n",
       "|---|---|\n",
       "| 2063 | 0.5058871 |\n",
       "| 2469 | 0.7445443 |\n",
       "| 1186 | 0.8116348 |\n",
       "| 1919 | 0.5168802 |\n",
       "| 1319 | 0.7462408 |\n",
       "| 729 | 0.7208654 |\n",
       "\n"
      ],
      "text/plain": [
       "     efficiency\n",
       "2063 0.5058871 \n",
       "2469 0.7445443 \n",
       "1186 0.8116348 \n",
       "1919 0.5168802 \n",
       "1319 0.7462408 \n",
       "729  0.7208654 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "   efficiency     \n",
       " Min.   :0.07601  \n",
       " 1st Qu.:0.64904  \n",
       " Median :0.75169  \n",
       " Mean   :0.72947  \n",
       " 3rd Qu.:0.84544  \n",
       " Max.   :0.96236  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "############\n",
    "#2e. Use the efficiencies( ) function to compute the BC’s eﬃciency score of each\n",
    "#producer.\n",
    "############\n",
    "df$te <- frontier::efficiencies(CD_model_SFA)\n",
    "\n",
    "\n",
    "head(df$te)\n",
    "summary(df$te)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "b8746358",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:07.699602Z",
     "iopub.status.busy": "2026-02-01T20:15:07.697676Z",
     "iopub.status.idle": "2026-02-01T20:15:08.243975Z",
     "shell.execute_reply": "2026-02-01T20:15:08.241086Z"
    },
    "papermill": {
     "duration": 0.561924,
     "end_time": "2026-02-01T20:15:08.246970",
     "exception": false,
     "start_time": "2026-02-01T20:15:07.685046",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nnfvRa869bdvTd5vWf/Nln23Z9oCF208agyUBwMa6//75HR0vG7g9adKzCopJ0BhdwNz1qH8+\nPiy98d8/85+9jTvO2uWUiz7xt61NIYTZh19wQu+l111y9sqewqy99r/gvOPMOQAANs1YTaYL\n9X+38MN/t/DF9xcPPPq0A48eo1UAAGQs/48cAsBmoceO9Al2ABBFjx3p85E2AIBMuGIHQFYW\nLFhQ6yVAzQh2ABDl4Yfn9fU1D9xubOxWd0KCBDsAiKLHjvT5jB0AQCYEOwCATBjFAkAUPXak\nT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXakT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXak\nT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXakT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXak\nT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXakT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXak\nT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXakT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXak\nT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXakT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXak\nT7ADgCh67EifUSwAQCYEOwCATBjFAkAUPXakT7ADIBULFiyo9RJGoseO9BnFAgBkQrADAMiE\nUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiEUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiE\nUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiEUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiE\nUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiEUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiE\nUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiEUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiE\nUSwARNFjR/oEOwCIoseO9BnFAgBkQrADAMiEUSwARNFjR/rGU7Arl8vVanXlypW1XkiKqtVq\nCMHGGc7A9uns7Ozq6qr1WhLlzbVBq1evrvUSElWtVjs6Ojo68v9lAj12Ccr7wDVw8urq6ho8\nefX19Y38kvEU7IrFYqFQmDJlSq0XkqJyudzR0WHjDGft2rXVanXChAlNTU21XkuKent7S6XS\nxIkTa72QFJVKpc7OzhDC5MmTC4VCrZeTovb29gkTJjQ0NNR6IWyJ8j7xtbe3VyqVpqamwZNX\nff0Gktt4CnYDHDuGNHC+sXFGViwWbaIh9ff319XV2Tgjq6+vr6vzueQhFAoFby5qZUvY8dZ/\nf23wKDT+gh0A1IQeO9In2AFAFD12pM9YAQAgE4IdAEAmjGIBIIoeO9In2AFAFD12pM8oFgAg\nE4IdAEAmjGIBIIoeO9In2AFAFD12pM8oFgAgE4IdAEAmjGIBIIoeO9In2AFAFD12pM8oFgAg\nE4IdAEAmjGIBIIoeO9In2AFAFD12CVqwYMFm+T7Lli3bLN+n5oxiAQAyIdgBAGTCKBYAouix\nI32CHQBE0WNH+oxiAQAyIdgBAGTCKBYAouixI32CHQBE0WNH+oxiAQAyIdgBAGTCKBYAouix\nI32CHQBE0WNH+oxiAQAyIdgBAGTCKBYAouixI32CHQBE0WNH+oxiAQAyIdgBAGTCKBYAouix\nI32CHQAv1THHHFPrJYwFPXakzygWACATgh0AQCaMYgEgih470ifYAUAUPXakzygWACATgh0A\nQCaMYgEgih470ifYAUAUPXakzygWACATgh0AQCaMYgEgih470ifYAUAUPXakzygWACATgh0A\nQCaMYgEgih470ifYAUAUPXakzygWACATgh0AQCaMYgEgih470ifYAUAUPXakzygWACATgh0A\nQCaMYgEgih470ifYAUAUPXakzygWACATgh0AQCaMYgEgih470ifYAUAUPXakzygWACATgh0A\nQCaMYgEgih470ifYAUAUPXakzygWACATgh0AQCaMYgEgih470ifYAUAUPXakzygWACATgh0A\nQCaMYgEgih470ifYAUAUPXakzygWACATgh0AQCaMYgEgih470ifYAUAUPXakzygWACATgh0A\nQCaMYgEgih470ifYAUAUPXakzygWACATgh0AQCaMYgEgih470ifYAUAUPXakzygWACATgh0A\nQCZqMIrtWbO6MqW1pa4w9v/TALDJ9NiRvrEOdj0r7/jAP1z0pn9d9o/bTAwhhFC5/brLb1n+\nyyfai3N332fRycfMbPGxPwBSpMeO9I3pKLZa6b78jM+1l6uD9zxy41mXXH/H6w8+7pxTF076\n/Q/P/NCVlbFcEABARsY02N19zZl3T33zc19X+y6+/v5ZR5x32Lx9d3vdG/9pyUmdf/retU92\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "############\n",
    "#2f. Plot a histogram of the TE scores. Use ggplot( ) function\n",
    "############\n",
    "ggplot(df, aes(x= te)) +\n",
    "  geom_histogram() +\n",
    "  geom_vline(aes(xintercept = mean(te)),\n",
    "             color=\"blue\", linetype=\"dashed\", linewidth=1) +\n",
    "  theme_bw()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "e24d5e1c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:08.270672Z",
     "iopub.status.busy": "2026-02-01T20:15:08.269065Z",
     "iopub.status.idle": "2026-02-01T20:15:08.478844Z",
     "shell.execute_reply": "2026-02-01T20:15:08.476067Z"
    },
    "papermill": {
     "duration": 0.22521,
     "end_time": "2026-02-01T20:15:08.482288",
     "exception": false,
     "start_time": "2026-02-01T20:15:08.257078",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "-------------------------------------------------------------------------------- \n",
       "Normal-Half Normal SF Model \n",
       "Dependent Variable:                                                        qt_ln \n",
       "Log likelihood solver:                                         BFGS maximization \n",
       "Log likelihood iter:                                                          94 \n",
       "Log likelihood value:                                                  -76.51896 \n",
       "Log likelihood gradient norm:                                        3.00395e-03 \n",
       "Estimation based on:                                        N =  826 and K =  11 \n",
       "Inf. Cr:                                           AIC  =  175.0 AIC/N  =  0.212 \n",
       "                                                   BIC  =  226.9 BIC/N  =  0.275 \n",
       "                                                   HQIC =  194.9 HQIC/N =  0.236 \n",
       "-------------------------------------------------------------------------------- \n",
       "Variances: Sigma-squared(v)   =                                          0.01711 \n",
       "           Sigma(v)           =                                          0.01711 \n",
       "           Sigma-squared(u)   =                                          0.18431 \n",
       "           Sigma(u)           =                                          0.18431 \n",
       "Sigma = Sqrt[(s^2(u)+s^2(v))] =                                          0.44881 \n",
       "Gamma = sigma(u)^2/sigma^2    =                                          0.91505 \n",
       "Lambda = sigma(u)/sigma(v)    =                                          3.28201 \n",
       "Var[u]/{Var[u]+Var[v]}        =                                          0.79651 \n",
       "Variances averaged over observations \n",
       "-------------------------------------------------------------------------------- \n",
       "Average inefficiency E[ui]     =                                         0.34255 \n",
       "Average efficiency E[exp(-ui)] =                                         0.73215 \n",
       "-------------------------------------------------------------------------------- \n",
       "Stochastic Production/Profit Frontier, e = v - u \n",
       "-----[ Tests vs. No Inefficiency ]-----\n",
       "Likelihood Ratio Test of Inefficiency\n",
       "Deg. freedom for inefficiency model                                            5 \n",
       "Log Likelihood for OLS Log(H0) =                                      -238.18494 \n",
       "LR statistic:  \n",
       "Chisq = 2*[LogL(H0)-LogL(H1)]  =                                       323.33195 \n",
       "Kodde-Palm C*:       95%: 10.37103                                 99%: 14.32482 \n",
       "Coelli (1995) skewness test on OLS residuals\n",
       "M3T: z                         =                                       -28.28133 \n",
       "M3T: p.value                   =                                         0.00000 \n",
       "Final maximum likelihood estimates \n",
       "-------------------------------------------------------------------------------- \n",
       "                         Deterministic Component of SFA \n",
       "-------------------------------------------------------------------------------- \n",
       "                          Coefficient Std. Error z value  Pr(>|z|)    \n",
       "(Intercept)                   0.31894    0.01463 21.8034 < 2.2e-16 ***\n",
       "lnd_ln                        0.52088    0.02459 21.1850 < 2.2e-16 ***\n",
       "cap_ln                        0.43364    0.01246 34.8155 < 2.2e-16 ***\n",
       "lab_ln                        0.09583    0.01187  8.0707  6.99e-16 ***\n",
       "fert_ln                       0.02133    0.00982  2.1717   0.02988 *  \n",
       "-------------------------------------------------------------------------------- \n",
       "                  Parameter in variance of u (one-sided error) \n",
       "-------------------------------------------------------------------------------- \n",
       "                          Coefficient Std. Error z value  Pr(>|z|)    \n",
       "Zu_(Intercept)                0.15793    0.52704  0.2997    0.7644    \n",
       "Zu_Age                       -0.13651    0.02721 -5.0166 5.260e-07 ***\n",
       "Zu_Age2                       0.00199    0.00033  6.0731 1.254e-09 ***\n",
       "Zu_genderMale                 0.13494    0.12141  1.1115    0.2664    \n",
       "Zu_policyReceived Support    -0.10663    0.15983 -0.6672    0.5046    \n",
       "-------------------------------------------------------------------------------- \n",
       "                 Parameters in variance of v (two-sided error) \n",
       "-------------------------------------------------------------------------------- \n",
       "                          Coefficient Std. Error z value  Pr(>|z|)    \n",
       "Zv_(Intercept)               -4.06802    0.15644 -26.004 < 2.2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "-------------------------------------------------------------------------------- \n",
       "Model was estimated on : Feb Sun 01, 2026 at 20:15 \n",
       "Log likelihood status: successful convergence  \n",
       "-------------------------------------------------------------------------------- "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "############\n",
    "#2g. Fit a Cobb-Douglas production frontier, including exogenous variables. Interpret the\n",
    "#result in the context of the exogenous variables.\n",
    "############\n",
    "\n",
    "sfa_cd_exog_var <- sfacross(\n",
    "  formula = qt_ln ~ lnd_ln + cap_ln + lab_ln + fert_ln,\n",
    "  data = df,\n",
    "  udist = \"hnormal\", # half-normal inefficiency\n",
    "  S = 1L, # production frontier: epsilon = v - u\n",
    "  uhet    = ~ Age + Age2 + gender +policy      # <-- exogenous variable in inefficiency term\n",
    ")\n",
    "\n",
    "summary(sfa_cd_exog_var)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "a8284109",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:08.517953Z",
     "iopub.status.busy": "2026-02-01T20:15:08.515548Z",
     "iopub.status.idle": "2026-02-01T20:15:08.557809Z",
     "shell.execute_reply": "2026-02-01T20:15:08.555290Z"
    },
    "papermill": {
     "duration": 0.064363,
     "end_time": "2026-02-01T20:15:08.561913",
     "exception": false,
     "start_time": "2026-02-01T20:15:08.497550",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A anova: 2 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>#Df</th><th scope=col>LogLik</th><th scope=col>Df</th><th scope=col>Chisq</th><th scope=col>Pr(&gt;Chisq)</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td> 7</td><td>-128.00176</td><td>NA</td><td>      NA</td><td>          NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>11</td><td> -76.51896</td><td> 4</td><td>102.9656</td><td>2.297848e-21</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A anova: 2 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & \\#Df & LogLik & Df & Chisq & Pr(>Chisq)\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 &  7 & -128.00176 & NA &       NA &           NA\\\\\n",
       "\t2 & 11 &  -76.51896 &  4 & 102.9656 & 2.297848e-21\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A anova: 2 × 5\n",
       "\n",
       "| <!--/--> | #Df &lt;dbl&gt; | LogLik &lt;dbl&gt; | Df &lt;dbl&gt; | Chisq &lt;dbl&gt; | Pr(&gt;Chisq) &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 |  7 | -128.00176 | NA |       NA |           NA |\n",
       "| 2 | 11 |  -76.51896 |  4 | 102.9656 | 2.297848e-21 |\n",
       "\n"
      ],
      "text/plain": [
       "  #Df LogLik     Df Chisq    Pr(>Chisq)  \n",
       "1  7  -128.00176 NA       NA           NA\n",
       "2 11   -76.51896  4 102.9656 2.297848e-21"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#2h. Use a likelihood ratio test to compare the Cobb-Douglas and Cobb-Douglas models\n",
    "#with z variables. Which model ﬁts the data statistically signiﬁcantly better?\n",
    "lrtest(sfa_cd, sfa_cd_exog_var)\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "00e77943",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-02-01T20:15:08.589873Z",
     "iopub.status.busy": "2026-02-01T20:15:08.588252Z",
     "iopub.status.idle": "2026-02-01T20:15:08.600671Z",
     "shell.execute_reply": "2026-02-01T20:15:08.598977Z"
    },
    "papermill": {
     "duration": 0.027343,
     "end_time": "2026-02-01T20:15:08.603171",
     "exception": false,
     "start_time": "2026-02-01T20:15:08.575828",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "\n",
    "#p-value < 0.00000000000000022 > stat. sign.\n",
    "\n",
    "#reject the null hypothesis. Including Age, Age2, and gender in the inefficiency\n",
    "#equation statistically significantly improves the model.\n",
    "#These exogenous variables explain variation in technical inefficiency among producers.\n",
    "\n",
    "#Age and Age2: capture a nonlinear effect of experience on efficiency. Efficiency\n",
    "#may increase with age up to a point, then decline for very old farmers.\n",
    "\n",
    "#Gender: Shows whether male or female producers systematically differ in inefficiency.\n",
    "\n",
    "#Model suggests that differences in inefficiency are not purely random but are\n",
    "#partly explained by observable characteristics like age and gender.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "86e76326",
   "metadata": {
    "papermill": {
     "duration": 0.010244,
     "end_time": "2026-02-01T20:15:08.623764",
     "exception": false,
     "start_time": "2026-02-01T20:15:08.613520",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 9049314,
     "sourceId": 14191942,
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
   "duration": 431.17844,
   "end_time": "2026-02-01T20:15:08.754804",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2026-02-01T20:07:57.576364",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

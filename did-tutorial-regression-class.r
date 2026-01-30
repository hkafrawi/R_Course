{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "24ffc9a3",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:47.241585Z",
     "iopub.status.busy": "2026-01-30T19:22:47.239549Z",
     "iopub.status.idle": "2026-01-30T19:22:48.316573Z",
     "shell.execute_reply": "2026-01-30T19:22:48.315025Z"
    },
    "papermill": {
     "duration": 1.084588,
     "end_time": "2026-01-30T19:22:48.318617",
     "exception": false,
     "start_time": "2026-01-30T19:22:47.234029",
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
       "'agrar-data'"
      ],
      "text/latex": [
       "'agrar-data'"
      ],
      "text/markdown": [
       "'agrar-data'"
      ],
      "text/plain": [
       "[1] \"agrar-data\""
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
   "id": "0b562105",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:48.353175Z",
     "iopub.status.busy": "2026-01-30T19:22:48.326602Z",
     "iopub.status.idle": "2026-01-30T19:22:49.750377Z",
     "shell.execute_reply": "2026-01-30T19:22:49.748755Z"
    },
    "papermill": {
     "duration": 1.430944,
     "end_time": "2026-01-30T19:22:49.752719",
     "exception": false,
     "start_time": "2026-01-30T19:22:48.321775",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "load(\"/kaggle/input/agrar-data/ag_data.RData\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "4420070a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:49.763518Z",
     "iopub.status.busy": "2026-01-30T19:22:49.761331Z",
     "iopub.status.idle": "2026-01-30T19:22:49.793126Z",
     "shell.execute_reply": "2026-01-30T19:22:49.791022Z"
    },
    "papermill": {
     "duration": 0.039494,
     "end_time": "2026-01-30T19:22:49.795441",
     "exception": false,
     "start_time": "2026-01-30T19:22:49.755947",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>district</th><th scope=col>year</th><th scope=col>treated</th><th scope=col>post</th><th scope=col>yield</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>2005</td><td>0</td><td>0</td><td> 7.468472</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>2005</td><td>0</td><td>0</td><td> 9.230250</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>2005</td><td>0</td><td>0</td><td>10.662116</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>2005</td><td>0</td><td>0</td><td>12.205940</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>2005</td><td>1</td><td>0</td><td>11.322831</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>2005</td><td>0</td><td>0</td><td>10.567062</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & district & year & treated & post & yield\\\\\n",
       "  & <int> & <int> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 2005 & 0 & 0 &  7.468472\\\\\n",
       "\t2 & 2 & 2005 & 0 & 0 &  9.230250\\\\\n",
       "\t3 & 3 & 2005 & 0 & 0 & 10.662116\\\\\n",
       "\t4 & 4 & 2005 & 0 & 0 & 12.205940\\\\\n",
       "\t5 & 5 & 2005 & 1 & 0 & 11.322831\\\\\n",
       "\t6 & 6 & 2005 & 0 & 0 & 10.567062\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | district &lt;int&gt; | year &lt;int&gt; | treated &lt;dbl&gt; | post &lt;dbl&gt; | yield &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1 | 2005 | 0 | 0 |  7.468472 |\n",
       "| 2 | 2 | 2005 | 0 | 0 |  9.230250 |\n",
       "| 3 | 3 | 2005 | 0 | 0 | 10.662116 |\n",
       "| 4 | 4 | 2005 | 0 | 0 | 12.205940 |\n",
       "| 5 | 5 | 2005 | 1 | 0 | 11.322831 |\n",
       "| 6 | 6 | 2005 | 0 | 0 | 10.567062 |\n",
       "\n"
      ],
      "text/plain": [
       "  district year treated post yield    \n",
       "1 1        2005 0       0     7.468472\n",
       "2 2        2005 0       0     9.230250\n",
       "3 3        2005 0       0    10.662116\n",
       "4 4        2005 0       0    12.205940\n",
       "5 5        2005 1       0    11.322831\n",
       "6 6        2005 0       0    10.567062"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(ag_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "9b29d066",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:49.805424Z",
     "iopub.status.busy": "2026-01-30T19:22:49.803784Z",
     "iopub.status.idle": "2026-01-30T19:22:49.818343Z",
     "shell.execute_reply": "2026-01-30T19:22:49.816139Z"
    },
    "papermill": {
     "duration": 0.022316,
     "end_time": "2026-01-30T19:22:49.821026",
     "exception": false,
     "start_time": "2026-01-30T19:22:49.798710",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "ag_data$treated_post <- ag_data$treated * ag_data$post"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "0968792a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:49.831753Z",
     "iopub.status.busy": "2026-01-30T19:22:49.829111Z",
     "iopub.status.idle": "2026-01-30T19:22:49.867639Z",
     "shell.execute_reply": "2026-01-30T19:22:49.866201Z"
    },
    "papermill": {
     "duration": 0.045665,
     "end_time": "2026-01-30T19:22:49.869844",
     "exception": false,
     "start_time": "2026-01-30T19:22:49.824179",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>district</th><th scope=col>year</th><th scope=col>treated</th><th scope=col>post</th><th scope=col>yield</th><th scope=col>treated_post</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>2005</td><td>0</td><td>0</td><td> 7.468472</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>2005</td><td>0</td><td>0</td><td> 9.230250</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>2005</td><td>0</td><td>0</td><td>10.662116</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>2005</td><td>0</td><td>0</td><td>12.205940</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>2005</td><td>1</td><td>0</td><td>11.322831</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>2005</td><td>0</td><td>0</td><td>10.567062</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & district & year & treated & post & yield & treated\\_post\\\\\n",
       "  & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 2005 & 0 & 0 &  7.468472 & 0\\\\\n",
       "\t2 & 2 & 2005 & 0 & 0 &  9.230250 & 0\\\\\n",
       "\t3 & 3 & 2005 & 0 & 0 & 10.662116 & 0\\\\\n",
       "\t4 & 4 & 2005 & 0 & 0 & 12.205940 & 0\\\\\n",
       "\t5 & 5 & 2005 & 1 & 0 & 11.322831 & 0\\\\\n",
       "\t6 & 6 & 2005 & 0 & 0 & 10.567062 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 6\n",
       "\n",
       "| <!--/--> | district &lt;int&gt; | year &lt;int&gt; | treated &lt;dbl&gt; | post &lt;dbl&gt; | yield &lt;dbl&gt; | treated_post &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 2005 | 0 | 0 |  7.468472 | 0 |\n",
       "| 2 | 2 | 2005 | 0 | 0 |  9.230250 | 0 |\n",
       "| 3 | 3 | 2005 | 0 | 0 | 10.662116 | 0 |\n",
       "| 4 | 4 | 2005 | 0 | 0 | 12.205940 | 0 |\n",
       "| 5 | 5 | 2005 | 1 | 0 | 11.322831 | 0 |\n",
       "| 6 | 6 | 2005 | 0 | 0 | 10.567062 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  district year treated post yield     treated_post\n",
       "1 1        2005 0       0     7.468472 0           \n",
       "2 2        2005 0       0     9.230250 0           \n",
       "3 3        2005 0       0    10.662116 0           \n",
       "4 4        2005 0       0    12.205940 0           \n",
       "5 5        2005 1       0    11.322831 0           \n",
       "6 6        2005 0       0    10.567062 0           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(ag_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "e3b3ab2e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:49.880251Z",
     "iopub.status.busy": "2026-01-30T19:22:49.878879Z",
     "iopub.status.idle": "2026-01-30T19:22:49.892857Z",
     "shell.execute_reply": "2026-01-30T19:22:49.890838Z"
    },
    "papermill": {
     "duration": 0.021823,
     "end_time": "2026-01-30T19:22:49.895242",
     "exception": false,
     "start_time": "2026-01-30T19:22:49.873419",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "treated_districts <- unique(ag_data$district[ag_data$treated == 1])\n",
    "control_districts <- unique(ag_data$district[ag_data$treated == 0])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "f3cd076c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:49.905609Z",
     "iopub.status.busy": "2026-01-30T19:22:49.904244Z",
     "iopub.status.idle": "2026-01-30T19:22:49.922934Z",
     "shell.execute_reply": "2026-01-30T19:22:49.921377Z"
    },
    "papermill": {
     "duration": 0.026486,
     "end_time": "2026-01-30T19:22:49.925119",
     "exception": false,
     "start_time": "2026-01-30T19:22:49.898633",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "40"
      ],
      "text/latex": [
       "40"
      ],
      "text/markdown": [
       "40"
      ],
      "text/plain": [
       "[1] 40"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "60"
      ],
      "text/latex": [
       "60"
      ],
      "text/markdown": [
       "60"
      ],
      "text/plain": [
       "[1] 60"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "length(treated_districts)\n",
    "length(control_districts)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "447bf896",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:22:49.935779Z",
     "iopub.status.busy": "2026-01-30T19:22:49.934429Z",
     "iopub.status.idle": "2026-01-30T19:23:10.870032Z",
     "shell.execute_reply": "2026-01-30T19:23:10.868449Z"
    },
    "papermill": {
     "duration": 20.944867,
     "end_time": "2026-01-30T19:23:10.873703",
     "exception": false,
     "start_time": "2026-01-30T19:22:49.928836",
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
    "install.packages('plm')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "642b88fc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:23:10.885029Z",
     "iopub.status.busy": "2026-01-30T19:23:10.883748Z",
     "iopub.status.idle": "2026-01-30T19:23:11.186711Z",
     "shell.execute_reply": "2026-01-30T19:23:11.185123Z"
    },
    "papermill": {
     "duration": 0.310881,
     "end_time": "2026-01-30T19:23:11.189351",
     "exception": false,
     "start_time": "2026-01-30T19:23:10.878470",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
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
    "library(plm)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "5e8dd71b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:23:11.200390Z",
     "iopub.status.busy": "2026-01-30T19:23:11.199038Z",
     "iopub.status.idle": "2026-01-30T19:23:11.230791Z",
     "shell.execute_reply": "2026-01-30T19:23:11.228819Z"
    },
    "papermill": {
     "duration": 0.040819,
     "end_time": "2026-01-30T19:23:11.233899",
     "exception": false,
     "start_time": "2026-01-30T19:23:11.193080",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A pdata.frame: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>district</th><th scope=col>year</th><th scope=col>treated</th><th scope=col>post</th><th scope=col>yield</th><th scope=col>treated_post</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1-2005</th><td>1</td><td>2005</td><td>0</td><td>0</td><td> 7.468472</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>1-2006</th><td>1</td><td>2006</td><td>0</td><td>0</td><td>10.215916</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>1-2007</th><td>1</td><td>2007</td><td>0</td><td>0</td><td> 8.737281</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>1-2008</th><td>1</td><td>2008</td><td>0</td><td>0</td><td> 9.296675</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>1-2009</th><td>1</td><td>2009</td><td>0</td><td>0</td><td> 7.637467</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>1-2010</th><td>1</td><td>2010</td><td>0</td><td>1</td><td> 7.430553</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A pdata.frame: 6 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & district & year & treated & post & yield & treated\\_post\\\\\n",
       "  & <fct> & <fct> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1-2005 & 1 & 2005 & 0 & 0 &  7.468472 & 0\\\\\n",
       "\t1-2006 & 1 & 2006 & 0 & 0 & 10.215916 & 0\\\\\n",
       "\t1-2007 & 1 & 2007 & 0 & 0 &  8.737281 & 0\\\\\n",
       "\t1-2008 & 1 & 2008 & 0 & 0 &  9.296675 & 0\\\\\n",
       "\t1-2009 & 1 & 2009 & 0 & 0 &  7.637467 & 0\\\\\n",
       "\t1-2010 & 1 & 2010 & 0 & 1 &  7.430553 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A pdata.frame: 6 × 6\n",
       "\n",
       "| <!--/--> | district &lt;fct&gt; | year &lt;fct&gt; | treated &lt;dbl&gt; | post &lt;dbl&gt; | yield &lt;dbl&gt; | treated_post &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1-2005 | 1 | 2005 | 0 | 0 |  7.468472 | 0 |\n",
       "| 1-2006 | 1 | 2006 | 0 | 0 | 10.215916 | 0 |\n",
       "| 1-2007 | 1 | 2007 | 0 | 0 |  8.737281 | 0 |\n",
       "| 1-2008 | 1 | 2008 | 0 | 0 |  9.296675 | 0 |\n",
       "| 1-2009 | 1 | 2009 | 0 | 0 |  7.637467 | 0 |\n",
       "| 1-2010 | 1 | 2010 | 0 | 1 |  7.430553 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "       district year treated post yield     treated_post\n",
       "1-2005 1        2005 0       0     7.468472 0           \n",
       "1-2006 1        2006 0       0    10.215916 0           \n",
       "1-2007 1        2007 0       0     8.737281 0           \n",
       "1-2008 1        2008 0       0     9.296675 0           \n",
       "1-2009 1        2009 0       0     7.637467 0           \n",
       "1-2010 1        2010 0       1     7.430553 0           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "panel_data <- pdata.frame(ag_data, index = c(\"district\", \"year\"))\n",
    "head(panel_data)\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "657c69d7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:23:11.244892Z",
     "iopub.status.busy": "2026-01-30T19:23:11.243575Z",
     "iopub.status.idle": "2026-01-30T19:23:11.336871Z",
     "shell.execute_reply": "2026-01-30T19:23:11.334871Z"
    },
    "papermill": {
     "duration": 0.101615,
     "end_time": "2026-01-30T19:23:11.339619",
     "exception": false,
     "start_time": "2026-01-30T19:23:11.238004",
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
       "Balanced Panel: n = 100, T = 10, N = 1000\n",
       "\n",
       "Residuals:\n",
       "    Min.  1st Qu.   Median  3rd Qu.     Max. \n",
       "-7.99501 -1.50894 -0.13377  1.60054  6.86765 \n",
       "\n",
       "Coefficients:\n",
       "              Estimate Std. Error t-value  Pr(>|t|)    \n",
       "(Intercept)  11.179717   0.137243 81.4592 < 2.2e-16 ***\n",
       "treated      -0.091309   0.217000 -0.4208  0.674007    \n",
       "post          0.520471   0.194091  2.6816  0.007449 ** \n",
       "treated_post  1.965005   0.306885  6.4031 2.343e-10 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    6477.1\n",
       "Residual Sum of Squares: 5628.1\n",
       "R-Squared:      0.13108\n",
       "Adj. R-Squared: 0.12846\n",
       "F-statistic: 50.0827 on 3 and 996 DF, p-value: < 2.22e-16"
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
    "formula <- yield ~ treated + post + treated_post\n",
    "pooled <- plm(formula, data=panel_data, model = \"pooling\")\n",
    "test1 <- plmtest(pooled, type = \"bp\")\n",
    "summary(pooled)\n",
    "summary(test1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "7f8f0b43",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:23:11.351557Z",
     "iopub.status.busy": "2026-01-30T19:23:11.350235Z",
     "iopub.status.idle": "2026-01-30T19:23:11.374213Z",
     "shell.execute_reply": "2026-01-30T19:23:11.371892Z"
    },
    "papermill": {
     "duration": 0.033213,
     "end_time": "2026-01-30T19:23:11.377112",
     "exception": false,
     "start_time": "2026-01-30T19:23:11.343899",
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
       "lm(formula = formula, data = ag_data)\n",
       "\n",
       "Residuals:\n",
       "    Min      1Q  Median      3Q     Max \n",
       "-7.9950 -1.5089 -0.1338  1.6005  6.8676 \n",
       "\n",
       "Coefficients:\n",
       "             Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept)  11.17972    0.13724  81.459  < 2e-16 ***\n",
       "treated      -0.09131    0.21700  -0.421  0.67401    \n",
       "post          0.52047    0.19409   2.682  0.00745 ** \n",
       "treated_post  1.96501    0.30688   6.403 2.34e-10 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 2.377 on 996 degrees of freedom\n",
       "Multiple R-squared:  0.1311,\tAdjusted R-squared:  0.1285 \n",
       "F-statistic: 50.08 on 3 and 996 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "formula <- yield ~ treated + post + treated_post\n",
    "linear_model <- lm(formula, data=ag_data)\n",
    "summary(linear_model)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "a7014212",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2026-01-30T19:23:11.388397Z",
     "iopub.status.busy": "2026-01-30T19:23:11.386989Z",
     "iopub.status.idle": "2026-01-30T19:25:07.794495Z",
     "shell.execute_reply": "2026-01-30T19:25:07.792776Z"
    },
    "papermill": {
     "duration": 116.416039,
     "end_time": "2026-01-30T19:25:07.797176",
     "exception": false,
     "start_time": "2026-01-30T19:23:11.381137",
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
      "also installing the dependency ‘stringmagic’\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages('fixest')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "25646c92",
   "metadata": {
    "papermill": {
     "duration": 0.007856,
     "end_time": "2026-01-30T19:25:07.814752",
     "exception": false,
     "start_time": "2026-01-30T19:25:07.806896",
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
     "datasetId": 9358359,
     "sourceId": 14649556,
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
   "duration": 143.324848,
   "end_time": "2026-01-30T19:25:07.940903",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2026-01-30T19:22:44.616055",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

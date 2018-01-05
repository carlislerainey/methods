
This is a set of notes introducing political science research methods.

# Immediate To-Do
- Misc.
   - [x] add `parties` data set
     - [x] data set
     - [x] codebook
     - [x] example
- [ ] Fractions and Percentages
   - [ ] rewrite text
   - [ ] add exercises
     - [x] add exercise for `state-governments` data set
     - [ ] add exercise for `anes` data set
     - [ ] add exercise for `social-pressure` data set
     - [ ] improve data sets and tables with kableExtra
     (https://haozhu233.github.io/kableExtra/awesome_table_in_pdf.pdf)
   - [ ] develop in-class example
   - [ ] add `state-governments` data set
     - [x] create file to clean the data: `data/R/clean-state-governments.R`
     - [x] create general .R file to create a vector of file types: `create-extensions.R`
     - [x] create file to compress data: `data/R/compress-data.R`
     - [x] initiate a .Rmd to describe the data sets: `data/data-sources.Rmd`
     - [x] create a file that re-does all cleaning and compressing: `data/R/clean-compress-all.R`
     - [ ] add quantitative state government ideology variable to data set
     - [ ] codebook
     - [ ] example
   - [ ] add `anes` 
     - [ ] data set
     - [ ] codebook
     - [ ] example
   - [x] add `social-pressure`
     - [x] data set
     - [x] codebook
     - [x] example
    

# Outline
  
## Part 1: Our Approach

- [ ] Concepts
    - [ ] Example: Democracy (Dahl’s concept of Polyarchy)
    - [ ] Engage the Literature: "The Confusing Case of Budgetary Incrementalism"
    - [ ] Review Exercises
- [] Questions
    - [x] Normative
    - [x] Descriptive
    - [x] Causal
    - [ ] Engage the Literature: *On Political Equality*.
    - [ ] Review Exercises
- [ ] Models
    - [ ] Principles of Model-Building
    - [ ] Example 1: Collective Action (Olson)
    - [ ] Example 2: Opinion Formation (Zaller)
    - [ ] Example 3: Electoral Rules and Mobilization (Rainey, 2014)
    - [ ] Example 4: Duverger’s Law (Clark and Golder)
    - [ ] In-Class Exercise: Explaining Vote Choice
- [ ] Measurement
    - [ ] Qualitative and Quantitative Variables
    - [ ] Reliability
    - [ ] Validity
    - [ ] Example 1: Measuring Democracy
    - [ ] Example 2: Measuring Voting
    - [ ] Engage the Literature: "The Myth of the Vanishing Voter" [link]
    - [ ] Exercise: Measuring Democracy
    - [ ] Exercise: "Counting" Marbles
- [ ] Comparisons
    - [ ] Three Ways Compare
        - [ ] Differences in Percentages (Qualitative, Qualitative) - some tables from American voter
        - [ ] Difference in Means (Qualitative, Quantitative) - life expectancy, wealth by democracy
        - [ ] Scatterplot (Quantitative, Quantitative) - gun control versus firearm deaths; health versus ACA opinions
    - [ ]  Four Ways to Get a Correlation
        - [ ] Causation
        - [ ] Reverse Causation
        - [ ] Confounder
        - [ ] Chance
    - [ ] Randomization
    - [ ] Example 1: Campaign Mailers
    - [ ] Example 2: Motivated Reasoning (Taber and Lodge 2006)
    - [ ] Example 3: "Do Politicians Racially Discriminate Against Constituents?"
    - [ ] Engage the Literature: Experiments in International Relations: Lab, Survey, and Field

## Part 2: Describing Lists of Numbers

- [ ] Histograms (Density)
- [ ] Introduction to R
- [ ] Reading Data into R
- [ ] Histograms in R
    - Working with Data: Polarization in Congress. 
- [ ] Average and SD
- [ ] Average and SD in R 
  - mean()
  - sd()
  - group_by() and summarize()
- [ ] Fractions and Percents
- [ ] Normal Approximation

## Part 3: Describing Relationships Between Quantitative Variables

- [ ] Review: Points and Lines
- [ ] Scatterplots in R
    - Working with Data: Health and Public Opinion in the 50 States
- [ ] The Correlation Coefficient
    - [ ] Exercise: Height and Handspan
    - [ ] Working with Data: Gamson's Law
    - [ ] Working with Data: Duverger's Law
- [ ] Prediction Using the Correlation Coefficient
    - Exercise: Height and Handspan, cont.
    - Working with Data: Predicting Presidential Election Using 2nd Quarter GDP
- [ ] Regression
    - [ ] In-Class Exercise: Fitting a Line
    - [ ] The Principle of Least Squares
    - [ ] Finding the Slope and Intercept that Minimizes the Squared Errors
    - [ ] Interpreting the Slope and Intercept
    - [ ] Working with Data: Predicting Presidential Election Using 2nd Quarter GDP
- [ ]  The R.M.S. Error of the Regression
    - Working with Data: Predicting Presidential Election Using 2nd Quarter GDP
- [ ]  Multiple Regression
    - Working with Data: Predicting Presidential Election Using 2nd Quarter GDP and Other Variables
- [ ] Regression in R    

## Part 4: Sample Surveys

- [ ] Calculating the Chances
    - [ ] Listing the Equally Likely Ways
    - [ ] Multiplication Rule and Independence
    - [ ] Addition Rule and Mutually Exclusive
    - [ ] Sampling With and Without Replacement
- [ ] The Urn Model
    - [ ] Chance Processes
    - [ ] Setting up an Urn Model
        - Tickets in the Urn
        - Number of Draws
        - Sum
    - [ ] Characterizing the Sum of the Draws
        - [ ] Expected Value
        - [ ] Standard Error
        - [ ] Normal Approximation
    - [ ] Characterizing the Average and Percentage
    - [ ] In-Class Exercise: Simulating Chance Processes
- [ ] The Design of Surveys
- [ ] Confidence Intervals for Percentages
- [ ] Confidence Intervals for Averages
- [ ] Hypothesis Tests for Percentages and Averages
    - In-Class Exercise: The Lady Tasting Tea
- [ ] Confidence and Hypothesis Tests for Differences

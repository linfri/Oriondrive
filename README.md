## Backstory

Oriondrive began as a collaborative project between Thomas Jackson Park ([Mystified](https://github.com/Mystified131)) and Linn Ruth Friberg in 2020. Initially, the project's output consisted of abstract hip-hop music generated procedurally using [GenerIter](https://github.com/GridPresence/GenerIter) and interwoven with generative speech from a GPT-2 model fed into the speech synthesizer. The only aspect of music that wasn't generative was mixing and effects; even cover artwork was generated using neural networks.

The project has found its musical identity in 2021 with the release of [3dd89f7d](https://archive.org/details/oriondrive-3). Linn created a now-retired REST API for voice generation with the help of programming in R, a skill she picked up during her time in the bachelor's program in statistics at Linköping University. As an experiment she wrote down her intentions for 2022, generated CRC-32 hashes for them and fed the results to the API. The output was processed with the help of a vocoder and mixed together with selected electronic tracks by Thomas. You can find out more about Oriondrive as a music project by following [this link](https://archive.org/download/linfri-repo/Oriondrive.pdf).

In 2022, Linn was motivated to explore the idea of integrating music and mathematical/research challenges. She designed a challenge during the summer of 2022 that would require active listening and exercising skills in linear algebra and statistics at the undergraduate level. This challenge is perfect for students of statistics or applied mathematics, or anyone with basic knowledge of statistics and linear algebra. It can be solved using R (recommended), Python or MATLAB, and there is a symbolic crypto prize for whoever solves it first. To solve the challenge, active listening to Oriondrive music is required.

## The Challenge

-   Listen to audio files "Matrix A" and "Matrix B", either [here](https://thtimepeace.bandcamp.com/album/the-matrix) or [here](https://archive.org/details/oriondrive-4). The robotic voice within the tracks repeats sequences of numbers and letters; the sequences contain five symbols in total, both numbers and letters. Pick the sequences within the respective tracks which are repeated most frequently.
-   Write down the sequences. If the sequence is 0a1aa, write it down as follows: <https://justpaste.it/0a1aa>
-   Follow the links you have just formed to get the data for matrix A and B respectively.
-   You should get two 7x7 quadratic matrices. The matrix that is aligned with the audio file "Matrix A" will be referred to as **A** from now on. The matrix that is aligned with the audio file "Matrix B" will be referred to as **B**.
-   Solve the matrix equation **AX** = **B** by finding **X**.
-   Add the **sixth** column of **X** to the **fourth** row of **X**, save it as a numerical vector x. Round the result to three decimals. Add the **fourth** column of **X** to the **sixth** row of **X**, save it as a numerical vector y. Round the result to three decimals.
-   Fit a simple linear regression model using the data in x for an independent variable and the data in y for a dependent variable.
-   Obtain fitted values and residuals for the model.
-   Take the absolute values for the fitted values, sum the values and round the result to nine decimals.
-   Take the absolute values for the residuals, sum the values and round the result to nine decimals.
-   You should have two values, each of them containing nine decimals. Add them to each other.
-   Take the resulting value (fractional part only). Enter it in the [Result Verification Form](https://linfri.shinyapps.io/oriondrive). If the value is 43.342057418, enter 342057418. If the value is right, you will get the account data for the crypto wallet with the symbolic prize. **Make sure to save the data, since you will get it only once.** If someone has already claimed the prize, the link to the reference solution (in R) will be available via the form.
-   If you liked the challenge, please consider a donation to Linn's ETH wallet (0x976F7dabdF756CE785135F8C312aC6b86C142304) - this will give her a motivation to design more challenges in the future.
-   Was the challenge too easy, or, perhaps, too hard? Feedback is always welcome!

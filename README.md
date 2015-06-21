# Getting-and-Cleaning-Data
Process

    For both the test and train datasets, produce an interim dataset:
        Extract the mean and standard deviation features (listed in CodeBook.md, section 'Extracted Features'). This is the values table.
        Get the list of activities.
        Put the activity labels (not numbers) into the values table.
        Get the list of subjects.
        Put the subject IDs into the values table.
    Join the test and train interim datasets.
    Put each variable on its own row.
    Rejoin the entire table, keying on subject/acitivity pairs, applying the mean function to each vector of values in each subject/activity pair. This is the clean dataset.
    Write the clean dataset to disk.

Cleaned Data

The resulting clean dataset is in this repository at: data/cleaned.txt. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.

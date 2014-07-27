## DATA DICTIONARY - Human Activity Recognition Using Smartphones Data Set

- ACTIVITY
        The activity was performed while wearing a smartphone
                1 WALKING
                2 WALKING_UPSTAIRS
                3 WALKING_DOWNSTAIRS
                4 SITTING
                5 STANDING
                6 LAYING

- SUBJECT
        An identifier of the subject who carried out the experiment
                1 .. 30

** time domain signals denoted by prefix 't' **

- tBodyAcc_XYZ
        body acceleration signals (3-axial)
- tGravityAcc_XYZ
        gravity acceleration signals (3-axial)
- tBodyAccJerk_XYZ
        Jerk signals derived from body linear acceleration (3-axial)
- tBodyGyro_XYZ
        gyroscope signals (3-axial)
- tBodyGyroJerk_XYZ
        Jerk signals derived from angular velocity (3-axial)
- tBodyAccMag
        Euclidean norm of body acceleration signals
- tGravityAccMag
        Euclidean norm of gravity acceleration signals
- tBodyAccJerkMag
        Euclidean norm of Jerk signals derived from body linear acceleration
- tBodyGyroMag
        Euclidean norm of gyroscope signals
- tBodyGyroJerkMag
        Euclidean norm of Jerk signals derived from angular velocity

** frequency domain signals denoted by prefix 'f' **

- fBodyAcc_XYZ
        FFT of body acceleration signals (3-axial)
- fBodyAccJerk_XYZ
        FFT of Jerk signals derived from body linear acceleration (3-axial)
- fBodyGyro_XYZ
        FFT of gyroscope signals (3-axial)
- fBodyAccMag
        FFT of Euclidean norm of body acceleration signals
- fBodyAccJerkMag
        FFT of Euclidean norm of Jerk signals derived from body linear acceleration
- fBodyGyroMag
        FFT of Euclidean norm of gyroscope signals
- fBodyGyroJerkMag
        FFT of Euclidean norm of Jerk signals derived from angular velocity

** The set of variables that were estimated from these signals **

- MEAN
        Mean value
- STD
        Standard deviation

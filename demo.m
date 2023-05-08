% Prompt user to select audio file
[filename, filepath] = uigetfile({'*.mp3;*.wav;*.m4a', 'Audio files (*.mp3,*.wav,*.m4a)'}, 'Select audio file');

% Check if user clicked cancel
if isequal(filename,0)
    disp('User clicked cancel');
    return;
end

% Read audio file using audioread
[audioIn,fs] = audioread(fullfile(filepath,filename));
coeffs=mfcc(audioIn(:, 1), fs);
x=[mean(coeffs) max(coeffs)];

% Predict the label
y=predict(svm_model, x);

% Display message
im=imread("chucky.jpg");
if (y)
    box=msgbox("Welcome, Chucky!", "Success", "custom", im);
else
    box=msgbox("Intruder!","Error","error");
end
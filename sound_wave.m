% Load an example audio file
[x, fs] = audioread(fullfile('data', 'Chucky_Bark.2.wav'));

% Compute the time vector
t = linspace(0, length(x)/fs, length(x));

% Plot the sound wave
plot(t, x(:, 1));
set(gca, 'FontSize', 14);
xlabel('Time (s)');
ylabel('Amplitude');
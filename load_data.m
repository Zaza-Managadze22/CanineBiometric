train_target=loadAudioFiles(fullfile('data', 'train', 'target', '*.wav'));
train_others=loadAudioFiles(fullfile('data', 'train', 'others', '*.wav'));

test_target=loadAudioFiles(fullfile('data', 'test', 'target', '*.wav'));
test_others=loadAudioFiles(fullfile('data', 'test', 'others', '*.wav'));

X_train=[train_target; train_others];
y_train=[ones(size(train_target, 1), 1); zeros(size(train_others, 1), 1)];

X_test=[test_target;test_others];
y_test=[ones(size(test_target, 1), 1); zeros(size(test_others, 1), 1)];

function data=loadAudioFiles(pathname)
    files=dir(pathname);
    m=length(files);
    numFeatures=13;
    data=zeros(m, (numFeatures + 1) * 2);
    for i=1:m
        fullpath=fullfile(files(i).folder, files(i).name);
        [audioIn,fs]=audioread(fullpath);
        coeffs=mfcc(audioIn(:, 1), fs, NumCoeffs=numFeatures);
        data(i,:)=[mean(coeffs) max(coeffs)];
    end
end
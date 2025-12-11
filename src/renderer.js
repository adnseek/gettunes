let selectedFile = null;

const selectFileBtn = document.getElementById('selectFileBtn');
const clearFileBtn = document.getElementById('clearFileBtn');
const processBtn = document.getElementById('processBtn');
const processAnotherBtn = document.getElementById('processAnotherBtn');
const retryBtn = document.getElementById('retryBtn');

const fileInfo = document.getElementById('fileInfo');
const fileName = document.getElementById('fileName');
const processingSection = document.getElementById('processingSection');
const progressContainer = document.getElementById('progressContainer');
const progressFill = document.getElementById('progressFill');
const progressText = document.getElementById('progressText');
const resultSection = document.getElementById('resultSection');
const errorSection = document.getElementById('errorSection');
const errorMessage = document.getElementById('errorMessage');

// Select file
selectFileBtn.addEventListener('click', async () => {
  const filePath = await window.electronAPI.selectFile();
  if (filePath) {
    selectedFile = filePath;
    const pathParts = filePath.split(/[\\/]/);
    fileName.textContent = pathParts[pathParts.length - 1];
    fileInfo.classList.remove('hidden');
    processingSection.classList.remove('hidden');
    errorSection.classList.add('hidden');
    resultSection.classList.add('hidden');
  }
});

// Clear file
clearFileBtn.addEventListener('click', () => {
  selectedFile = null;
  fileInfo.classList.add('hidden');
  processingSection.classList.add('hidden');
  progressContainer.classList.add('hidden');
  resultSection.classList.add('hidden');
  errorSection.classList.add('hidden');
});

// Process audio
processBtn.addEventListener('click', async () => {
  if (!selectedFile) return;

  // Generate output filename
  const pathParts = selectedFile.split(/[\\/]/);
  const originalName = pathParts[pathParts.length - 1];
  const nameWithoutExt = originalName.replace(/\.[^/.]+$/, '');
  const defaultOutputName = `${nameWithoutExt}_no_speech.mp3`;

  // Ask user where to save
  const outputPath = await window.electronAPI.saveFile(defaultOutputName);
  if (!outputPath) return;

  // Start processing
  processBtn.disabled = true;
  progressContainer.classList.remove('hidden');
  resultSection.classList.add('hidden');
  errorSection.classList.add('hidden');
  progressFill.style.width = '0%';
  progressText.textContent = 'Verarbeitung läuft...';

  try {
    const result = await window.electronAPI.processAudio(selectedFile, outputPath);

    if (result.success) {
      progressContainer.classList.add('hidden');
      resultSection.classList.remove('hidden');
      processBtn.disabled = false;
    } else {
      throw new Error(result.error || 'Unbekannter Fehler');
    }
  } catch (error) {
    console.error('Error:', error);
    progressContainer.classList.add('hidden');
    errorSection.classList.remove('hidden');
    errorMessage.textContent = error.message || 'Ein Fehler ist aufgetreten';
    processBtn.disabled = false;
  }
});

// Process another file
processAnotherBtn.addEventListener('click', () => {
  selectedFile = null;
  fileInfo.classList.add('hidden');
  processingSection.classList.add('hidden');
  progressContainer.classList.add('hidden');
  resultSection.classList.add('hidden');
  errorSection.classList.add('hidden');
});

// Retry
retryBtn.addEventListener('click', () => {
  errorSection.classList.add('hidden');
  processBtn.click();
});

// Listen for progress updates
window.electronAPI.onProgressUpdate((progress) => {
  progressFill.style.width = `${progress.percent}%`;
  progressText.textContent = progress.message || 'Verarbeitung läuft...';
});

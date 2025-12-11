const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('electronAPI', {
  selectFile: () => ipcRenderer.invoke('select-file'),
  saveFile: (defaultName) => ipcRenderer.invoke('save-file', defaultName),
  processAudio: (inputPath, outputPath) => ipcRenderer.invoke('process-audio', inputPath, outputPath),
  onProgressUpdate: (callback) => ipcRenderer.on('progress-update', (event, progress) => callback(progress))
});

# GetTunes - Speech Removal App

Eine Electron-App für Windows, die Sprache aus MP3-Dateien entfernt und nur die Musikteile übrig lässt.

## Features

- 🎵 Hochwertige KI-basierte Sprachentfernung mit Demucs
- 🖥️ Läuft ohne Admin-Rechte
- 🎨 Moderne, benutzerfreundliche Oberfläche
- 📊 Echtzeit-Fortschrittsanzeige
- 🎧 Unterstützt MP3, WAV, FLAC, M4A, OGG

## Technologie-Stack

- **Electron** - Desktop-Framework
- **Demucs** - KI-basierte Vocal Separation (State-of-the-art)
- **FFmpeg** - Audio-Verarbeitung
- **Node.js** - Backend
- **Python** - Demucs-Integration

## Installation

### Voraussetzungen

1. **Node.js** (v18+): https://nodejs.org/
2. **Python** (v3.8+): https://www.python.org/
3. **Git**: https://git-scm.com/

### Setup-Schritte

1. Repository klonen:
```bash
git clone <repository-url>
cd gettunes
```

2. Node.js Abhängigkeiten installieren:
```bash
npm install
```

3. Python-Abhängigkeiten installieren:
```bash
python python/setup.py
```

Oder manuell:
```bash
pip install demucs
```

## Verwendung

### Entwicklungsmodus

```bash
npm start
```

### App bauen

Windows-Installer erstellen:
```bash
npm run build
```

Portable Version erstellen:
```bash
npm run build:portable
```

Die fertige App befindet sich im `dist/` Ordner.

## Wie es funktioniert

1. **Datei hochladen**: Wähle eine MP3-Datei aus
2. **Verarbeitung**: Demucs trennt Sprache von Musik mittels neuronalen Netzen
3. **Export**: Die bereinigte Datei (nur Musik) wird gespeichert

### Demucs-Modell

GetTunes verwendet das **htdemucs** Modell von Meta/Facebook Research:
- State-of-the-art Vocal Separation
- Hochwertige Audio-Qualität
- Basiert auf Hybrid Transformer Demucs Architektur

Beim ersten Start wird das Modell (~2GB) automatisch heruntergeladen.

## Hinweise

- **Erste Verarbeitung**: Der erste Lauf kann länger dauern (Modell-Download)
- **Verarbeitungszeit**: Je nach Dateilänge 1-5 Minuten
- **Qualität**: Beste Ergebnisse mit klarer Musik und Sprache

## Lizenz

MIT License

## Credits

- **Demucs**: https://github.com/facebookresearch/demucs
- **Electron**: https://www.electronjs.org/
- **FFmpeg**: https://ffmpeg.org/

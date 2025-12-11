# GetTunes - Speech Removal App

Eine Electron-App für Windows, die Sprache aus MP3-Dateien entfernt und nur die Musikteile übrig lässt.

## Features

- 🎵 Hochwertige KI-basierte Sprachentfernung mit Demucs
- 🔄 Automatische Fallback-Methode wenn Demucs nicht verfügbar ist
- 🖥️ Läuft ohne Admin-Rechte
- 🎨 Moderne, benutzerfreundliche Oberfläche
- 📊 Echtzeit-Fortschrittsanzeige
- 🎧 Unterstützt MP3, WAV, FLAC, M4A, OGG
- ✅ Funktioniert mit Python 3.8 bis 3.14+ (oder ganz ohne Python!)

## Technologie-Stack

- **Electron** - Desktop-Framework
- **Demucs** (optional) - KI-basierte Vocal Separation (State-of-the-art)
- **FFmpeg** - Audio-Verarbeitung und Fallback-Methode
- **Node.js** - Backend
- **Python** (optional) - Für beste Qualität mit Demucs

## Installation

### Voraussetzungen

**Erforderlich:**
1. **Node.js** (v18+): https://nodejs.org/
2. **Git**: https://git-scm.com/

**Optional (für beste Qualität):**
3. **Python** (v3.8+): https://www.python.org/
   - ✅ Funktioniert mit Python 3.8 bis 3.14+
   - 📦 Empfohlen: Python 3.11 oder 3.14
   - ⚠️ Die App funktioniert auch **ohne Python**, verwendet dann aber die Fallback-Methode

### Setup-Schritte

1. Repository klonen:
```bash
git clone -b claude/electron-speech-removal-app-01Lxo8kKNhQszXFkkBYy6FeW https://github.com/adnseek/gettunes.git
cd gettunes
```

2. Node.js Abhängigkeiten installieren:
```bash
npm install
```

3. **Optional:** Python-Abhängigkeiten für beste Qualität:
```bash
python python/setup.py
```

Oder führe einfach das Setup-Script aus:
```bash
setup-windows.bat
```

Die App funktioniert auch ohne Demucs, verwendet dann aber eine Fallback-Methode mit etwas geringerer Qualität.

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

GetTunes verwendet **zwei Methoden** für die Sprachentfernung:

### Methode 1: Demucs AI (Beste Qualität)
Falls Python + Demucs installiert sind:
1. **Datei hochladen**: Wähle eine MP3-Datei aus
2. **AI-Verarbeitung**: Demucs trennt Sprache von Musik mittels neuronalen Netzen
3. **Export**: Die bereinigte Datei (nur Musik) wird gespeichert

Das **htdemucs** Modell von Meta/Facebook Research bietet:
- State-of-the-art Vocal Separation
- Hochwertige Audio-Qualität
- Basiert auf Hybrid Transformer Demucs Architektur

Beim ersten Start wird das Modell (~2GB) automatisch heruntergeladen.

### Methode 2: Spektral-Analyse (Fallback)
Falls Demucs nicht verfügbar ist:
1. Verwendet FFmpeg's Audio-Filter für Vokalentfernung
2. Entfernt center-panned Vocals durch Kanal-Subtraktion
3. Schneller, aber etwas geringere Qualität als Demucs

Die App wählt automatisch die beste verfügbare Methode!

## Hinweise

- **Erste Verarbeitung**: Der erste Lauf kann länger dauern (Modell-Download)
- **Verarbeitungszeit**: Je nach Dateilänge 1-5 Minuten
- **Qualität**: Beste Ergebnisse mit klarer Musik und Sprache

## Troubleshooting

### ❌ Demucs Installation schlägt fehl (Python 3.14)

**Problem**: `pip install demucs` funktioniert nicht mit Python 3.14

**Lösung**: Installiere die neueste Version direkt von GitHub:
```bash
python -m pip install -U git+https://github.com/facebookresearch/demucs#egg=demucs
```

Oder führe einfach das Setup-Script aus:
```bash
setup-windows.bat
```

**Keine Sorge**: Die App funktioniert auch ohne Demucs! Sie verwendet dann automatisch die Fallback-Methode.

### ❌ "Python not found" Fehler

**Lösung**:
- Stelle sicher, dass Python zur PATH-Umgebungsvariable hinzugefügt wurde
- Öffne eine **neue** Kommandozeile nach der Python-Installation
- Versuche `py --version` statt `python --version`

### ❌ App startet nicht

**Lösung**:
```bash
# Node.js Dependencies neu installieren
rm -rf node_modules
npm install
```

## Lizenz

MIT License

## Credits

- **Demucs**: https://github.com/facebookresearch/demucs
- **Electron**: https://www.electronjs.org/
- **FFmpeg**: https://ffmpeg.org/

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
- **Python 3.8-3.11** - Demucs-Integration

## Installation

### Voraussetzungen

1. **Node.js** (v18+): https://nodejs.org/
2. **Python** (v3.8 - v3.11): https://www.python.org/
   - ⚠️ **WICHTIG**: Nur Python 3.8 bis 3.11 werden unterstützt!
   - ✅ **Empfohlen: Python 3.11**
   - 🔗 Download Python 3.11: https://www.python.org/downloads/release/python-31110/
   - ❌ Python 3.12+ funktioniert NICHT mit Demucs
   - 📝 **Hinweis**: Auf Windows heißt der Befehl meist `py` statt `python`
3. **Git**: https://git-scm.com/

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

3. Python-Abhängigkeiten installieren:

**Einfache Installation (empfohlen):**
```bash
setup-windows.bat
```

**Manuelle Installation:**
```bash
python python/setup.py
```

Oder direkt (Windows):
```bash
py -m pip install demucs
```

Oder (wenn `python` funktioniert):
```bash
python -m pip install demucs
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

## Troubleshooting

### ❌ Demucs Installation schlägt fehl

**Problem**: `pip install demucs` funktioniert nicht

**Häufigste Ursache**: Falsche Python-Version!

**Lösung**:
1. Überprüfe deine Python-Version: `python --version`
2. Wenn du Python 3.12+ hast, **deinstalliere es**
3. Installiere Python 3.11: https://www.python.org/downloads/release/python-31110/
4. Stelle sicher, dass "Add Python to PATH" aktiviert ist
5. Öffne eine **neue** Kommandozeile
6. Führe setup-windows.bat aus

**Wichtig**: Demucs funktioniert nur mit Python 3.8-3.11!

### ❌ "Python not found" Fehler

**Lösung**:
- Stelle sicher, dass Python zur PATH-Umgebungsvariable hinzugefügt wurde
- Öffne eine **neue** Kommandozeile nach der Python-Installation
- Auf Windows: Die App versucht automatisch `py`, `python` und `python3`
- Teste welcher funktioniert: `py --version` oder `python --version`

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

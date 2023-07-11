# powershell-scripts > readme

1. [日本語](#日本語)
    1. [a-encode-to-opus.ps1(ja)](#a-encode-to-opusps1ja)
	2. [a-normalize.ps1(ja)](#a-normalizeps1ja)
	3. [v-encode.ps1(ja)](#v-encodeps1ja)
2. [English](#english)
    1. [a-encode-to-opus.ps1(en)](#a-encode-to-opusps1en)
	2. [a-normalize.ps1(en)](#a-normalizeps1en)
	3. [v-encode.ps1(en)](#v-encodeps1en)

## 日本語
このリポジトリは「Power Shell」の自作スクリプトを保存しています。このスクリプトが誰かの役に立てば幸いと思い、リポジトリを公開しています。各スクリプトの解説は以下の通りです。

### a-encode-to-opus.ps1(ja)
現在のディレクトリにおいて、特定の拡張子を持つすべての音声ファイルのラウドネス値を取得し、音声のラウドネス値の正規化とノイズを除去する。また音声ファイルをビットレートが160kのopusに変換する。opusファイルは現在のディレクトリに生成される。引数は対象にしたいファイルの拡張子。

### a-normalize.ps1(ja)
現在のディレクトリにおいて、特定の拡張子を持つすべての音声ファイルのラウドネス値を取得し、音声のラウドネス値の正規化とノイズを除去する。ラウドネス値が正規化された音声ファイルは、現在のディレクトリの下に作成される「normalized」というディレクトリに保存される。引数は対象にしたいファイルの拡張子。

### v-encode.ps1(ja)
動画のラウドネス値を取得し、音声のラウドネス値の正規化とノイズを除去、さらに映像をHEVCでエンコードする。NVENCを用いるのでGeForceシリーズのGPUが必要。引数はエンコードを行いたい動画ファイルのパス。現在のディレクトリでスクリプトを実行するなら拡張子を含むファイル名だけでよい。

## English
This repository is the storage preserving my scripts of "Power Shell". I publicing this repository because I am happy if my scripts help someone. There are explanation of each scripts at below.

### a-encode-to-opus.ps1(en)
Get loudness value of all audio file having certain filename extension on current directory, then normalize and remove the noise from these. And convert audio file to "opus" that the bitrate is 160k. opus file is generated at current directory.The parameter is the filename extension that want to target.

### a-normalize.ps1(en)
Get loudness value of all audio file having certain filename extension on current directory, then normalize and remove the noise from these. Normalized audio file is generated at a directory: "normalized". The parameter is the filename extension that want to target.

### v-encode.ps1(en)
Get loudness value of video file on current directory, then normalize and remove the noise from it. And encode video to HEVC. This need GPU of GeForce series because use NVENC. The parameter is a path of video file that want to encode. It is filename contained the filename extension only if run a script in current directory.

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Speech

$outDir = Join-Path $PSScriptRoot "..\samples"
New-Item -ItemType Directory -Force $outDir | Out-Null

$e = [char]0x00E9

$samples = @(
    @{ File = "voice_describe_image.wav"; Voice = "Microsoft Zira Desktop";
       Text = "Can you describe this image in detail? What is the mood of the scene?" },
    @{ File = "voice_question.wav"; Voice = "Microsoft David Desktop";
       Text = "What are three advantages of running an AI assistant locally instead of in the cloud?" },
    @{ File = "voice_question_fr.wav"; Voice = "Microsoft Hortense Desktop";
       Text = "Quel moment de la journ${e}e est repr${e}sent${e} sur cette image, et pourquoi ?" }
)

$format = New-Object System.Speech.AudioFormat.SpeechAudioFormatInfo(
    16000, [System.Speech.AudioFormat.AudioBitsPerSample]::Sixteen,
    [System.Speech.AudioFormat.AudioChannel]::Mono)

foreach ($s in $samples) {
    $synth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    try {
        $synth.SelectVoice($s.Voice)
        $synth.Rate = -1
        $path = [System.IO.Path]::GetFullPath((Join-Path $outDir $s.File))
        $synth.SetOutputToWaveFile($path, $format)
        $synth.Speak($s.Text)
        Write-Host "wrote $path"
    } finally {
        $synth.Dispose()
    }
}

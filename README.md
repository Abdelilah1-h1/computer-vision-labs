# Computer Vision Labs

![Python](https://img.shields.io/badge/Python-3.11-3776AB?logo=python&logoColor=white)
![OpenCV](https://img.shields.io/badge/OpenCV-classical%20CV-5C3EE8?logo=opencv&logoColor=white)
![PyTorch](https://img.shields.io/badge/PyTorch-foundation%20models-EE4C2C?logo=pytorch&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

Applied computer vision projects built for the Computer Vision module of the MIATE Master
(Faculté Pluridisciplinaire de Nador, Université Mohammed Premier). They cover classical
image processing, foundation models, generative AI and fully local multimodal inference.

## Projects

| Exercise | Project | What it does | Key technologies |
|:-:|---|---|---|
| 1 | [Noisy image cleaning and OCR](ocr-noisy-image-cleaning/) | Recovers a word hidden in a heavily noisy image (**EXAM8**, confidence 0.99) | OpenCV, PaddleOCR |
| 3 | [Detection, segmentation and depth](object-detection-segmentation-depth/) | Finds an object from a text prompt, segments it and estimates its distance (**4.76 m**) | Grounding DINO, SAM, Depth Anything V2 |
| 4 | [Interior redesign](ai-interior-redesign/) | Turns a photo of a cluttered room into a tidy one, keeping its structure | Stable Diffusion 1.5, Diffusers |
| 5 | [Local multimodal assistant](local-multimodal-assistant/) | Private assistant that understands text, images and voice, with no cloud API | Ollama, Gemma 4, Whisper |

Exercise numbers follow the course assignment. Exercise 2 is a separate project and lives in
its own repository, [emergency-vehicle-detection](https://github.com/Abdelilah1-h1/emergency-vehicle-detection).

## Highlights

- **Classical vision with a method.** In exercise 1 the order of the filters follows from the
  measured nature of the noise (impulse, then Gaussian).
- **Models chained on purpose.** In exercise 3 the box from Grounding DINO prompts SAM, and
  the distance is measured on the SAM mask rather than on the box.
- **Prompt engineering with evidence.** In exercise 4 the effect of `strength` is compared
  (0.60 versus 0.35) and the prompts are explained.
- **Local and measured.** Exercise 5 runs entirely on the machine, with inference tracking and
  automated tests.

## Repository layout

```
computer-vision-labs/
├── ocr-noisy-image-cleaning/            exercise 1
├── object-detection-segmentation-depth/ exercise 3
├── ai-interior-redesign/                exercise 4
├── local-multimodal-assistant/          exercise 5
├── LICENSE
└── README.md
```

Each project folder is self-contained, with its own `README.md`, `requirements.txt`
and results.

## Getting started

```bash
git clone https://github.com/Abdelilah1-h1/computer-vision-labs.git
cd computer-vision-labs/<project-folder>
python -m venv .venv
.venv\Scripts\activate          # Windows  (Linux / macOS: source .venv/bin/activate)
pip install -r requirements.txt
```

Then follow the instructions of the project's own README.

| Exercise | Environment | Notes |
|:-:|---|---|
| 1 OCR | Python 3.11, CPU | PaddleOCR models are downloaded on the first run |
| 3 Detection + depth | Python 3.11, CPU | About 1 GB of models downloaded on the first run |
| 4 Interior redesign | Python 3.11, CPU | No GPU needed; about 140 s per generation on CPU |
| 5 Assistant | Windows, Ollama | Developed on a laptop with an RTX 4070 (8 GB VRAM) |

## Credits

Developed by **Abdelilah Tehami** and **Mohamed Alaoui** (Team 09), Master AI and Emerging
Technologies, Université Mohammed Premier.

## License

Released under the MIT License. See [LICENSE](LICENSE).

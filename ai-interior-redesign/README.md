# Interior Redesign with Generative AI

Turning a photo of a cluttered room into a tidy, well-arranged version, with a
diffusion model in *image-to-image* mode.

## Before / after

| Before | After |
|---|---|
| ![before](before.png) | ![after](after.png) |

The structure of the room is kept (ceiling rose and chandelier, mouldings, position
of the window, sofa, coffee table, armchair and wall frame), while the clutter
disappears and the style becomes cleaner.

## Model

`SG161222/Realistic_Vision_V5.1_noVAE`, a Stable Diffusion 1.5 variant optimised
for photorealism, used through `StableDiffusionImg2ImgPipeline`.

## Prompt strategy

**1. Positive prompt: describe the desired state, not another room.**
The `same layout, same furniture positions` part is the most important: without it,
the model invents a completely different room instead of tidying the one in the
photo.

The room also has to be named (`living room`): with only `room`, the model took the
low sofa along the wall for a bed and turned the living room into a bedroom.

**2. Negative prompt: name what must disappear.**
`clutter, mess, scattered objects, laundry, boxes, cables` targets the actual
clutter. `bed, bedroom` prevents the sofa / bed confusion described above.
On this task, the negative prompt matters as much as the positive one.

**3. `strength`: the decisive parameter.**

| value | result |
|---|---|
| 0.60 | unrecognisable room: different window, different furniture |
| **0.35** | same ceiling, same chandelier, same window, tidy room |

Going from 0.60 to 0.35 is what made the result faithful to the original room.

**4. `guidance_scale = 8.0`**: follows the prompt without distorting the furniture.

## Running on CPU

No GPU required. Measured times:

| Step | Duration |
|---|---|
| Model download + loading | ~145 s (once, then cached) |
| Generation (14 effective steps) | ~140 s |

The image is resized to 512 px to keep the running time reasonable.

```
pip install -r requirements.txt
```

Open `exercise_4.ipynb` and run the cells. The notebook saves `before.png`
and `after.png`.

## Note

No random seed is set: each run produces a different result. If the room drifts too
far from the original, run the cell again or lower `strength` to 0.30.

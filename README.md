# Vapoursynth on Nix

These are [Nix derivations][nix] for an assortment of [VapourSynth][vapoursynth] plugins.

[VapourSynth][vapoursynth] is a video processing framework with a rich ecosystem of plugins. The plugins themselves are written in a variety of languages, and each comes with its own set of dependencies and required build tooling. This heteregeneity is a serious obstacle in getting a basic VapourSynth environment up and running.

Here’s where [Nix][nix] comes in. With Nix, we can declare all of these complex dependencies and automatically get reproducible and portable development environments. One command — and you’re ready to start processing videos!

#### Included plugins:

- [Khanattila/KNLMeansCL](https://github.com/Khanattila/KNLMeansCL)
- [EleonoreMix/fmtconv](https://github.com/EleonoreMizo/fmtconv)
- [VFR-maniac/L-SMASH-Works](https://github.com/VFR-maniac/L-SMASH-Works/tree/master/VapourSynth)
- [myrsloik/VapourSynth-FFT3DFilter](https://github.com/myrsloik/VapourSynth-FFT3DFilter)
- [HomeOfVapourSynthEvolution/VapourSynth-BM3D](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-BM3D)
- [dubhater/vapoursynth-cnr2](https://github.com/dubhater/vapoursynth-cnr2)
- [dubhater/vapoursynth-nnedi3](https://github.com/dubhater/vapoursynth-nnedi3)
- [dubhater/vapoursynth-mvtools](https://github.com/dubhater/vapoursynth-mvtools) (from NixPkgs)


### Usage

Load a new shell with Python 3.8, VapourSynth, ffmpeg, and lsmash installed.

```sh
nix-shell default.nix
```


### License

[MIT][license-url] © [Sander Melnikov][maintainer-url].


[nix]: https://nixos.org/
[vapoursynth]: https://github.com/vapoursynth/vapoursynth
[maintainer-url]: https://github.com/sandydoo
[license-url]: https://github.com/sandydoo/vapoursynth-on-nix/blob/main/LICENSE

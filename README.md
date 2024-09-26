# mamelon-nix

mamelon-nix is simply Mamelon (an amazing Japanese font with rounded characters) packaged for nix.
Before anyone points out that there is a PR open for this exact font here is the PR in question...by me: [#343995](https://github.com/NixOS/nixpkgs/pull/343995)
All credit goes to the original creator of Mamelon. I highly reccomend checking out his/her other fonts over at: [moji-waku](https://moji-waku.com/). I might package some of the other ones as well.

#### DISCLAIMER: The version and license I set in package.nix are most likely wrong, if you happen to know the correct version/license please do open a PR or email me.

## Installation

### NixOS
```nix
# flake.nix
{
  inputs.mamelon = {
    url = "github:elias-ainsworth/mamelon-nix";
    inputs.nixpkgs.follows = "nixpkgs"; # override this repo's nixpkgs snapshot
  };
}
```

Then, include it in your `environment.systemPackages` or `home.packages` by referencing the input:
```nix
inputs.mamelon.packages.${pkgs.system}.default
  
```

## Usage

Declare `Mamelon` as your font wherever you need it (I don't really have to elaborate here...*right?*).

> [!TIP]
> When calling the font when declared elsewhere **in your nix config** via string interpolation it might be best to add quotes when calling it in something like a waybar configuration as font-config lists the font name wierdly...
> For example:
> Suppose you have your font declared like this:
> ```nix
>   ...
>   options.custom = with lib; {
>     fonts = {
>       regular = mkOption {
>         type = types.str;
>         default = "Mamelon";
>         # default = "Iosevka Nerd Font Propo";
>         description = "The font to use for regular text";
>       };
>       ...
>     };
>     ...
>   }; 
> ```
> If you do not declare your waybar font as such:
> ```nix
>   baseModuleCss = ''
>     font-family: "${config.custom.fonts.regular}";
>     ...
>   ''
> ```
> and skip out on the double quotes around `${config.custom.fonts.regular}`, `font-family` gets set as 
> ```css
> font-family: Mamelon,マメロン,Mamelon 3 Hi,マメロン 3 Hi Regular,荽莁莍莓
> ```
> and of course it scares waybar shitless.

## Credits
As always my dumbass would not have been able complete this without the helpful people over at Vimjoyer's server...and I basically copied the structure for flake.nix and this README from Grandmaster Iynaix's [focal](https://github.com/iynaix/focal), do check it out it's great.

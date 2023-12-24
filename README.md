

This script makes use of the Bureau of Meteorology public AMOC XML Severe Thunderstorm warning data to generate audio warnings for broadcast by IRLP nodes.

Details about the BoM API and the AMOC XML standards can be seen in [README_BoM_API.md](README_BoM_API.md)


## Requirements
The stormcheck script requires the following operating system packages to be installed and available:
- wget
- sox

## Installing
The stormcheck script and the stormcheck_locations.* configuration files need to be placed in the **$CUSTOM/scripts** directory on the IRLP node (i.e. /home/irlp/custom/scripts/). The stormcheck audio files need to be placed in the custom audio subdirectory: **$AUDIO/custom/stormcheck** (i.e /home/irlp/audio/custom/stormcheck/)

Note that this script also uses audio files from the **$AUDIO/custom** directory to announce the time elements - if they are not available on your node they can be copied from the 'aussieprompts' directory.

Details on creating additional audio files if required can be found in [README_Audio.md](README_Audio.md)

## Configuration
Each state has a 'stormcheck_locations' file, which contains all of the Bureau of Meteorology Public Warning (PW) and Metropolitan (ME) regions used in their Severe Thunderstorm warnings. Each file contains multiple lines, each with two elements, being the warning area code, and the plain text name used for that area. the 'PW' warning areas cover larger geographic regions, whilst the 'ME' warning areas are used for more detailed warnings in major metro areas.

The script compares UNCOMMENTED lines with the downloaded warning data to determine which areas the warning is valid for. The audio files that are played have the same name as the 'Area Description', with spaces replaced by underscores.

An example for VK8 that would play warnings only for the Daly and Darwin areas would potentially look like this, in the stormcheck_locations.vk8 file:
```
#
# Uncomment entries below that you require a warning to be announced for.
# Do not change the text - or the warnings will not work :-)
#

## State-based public warning areas
NT_PW001    Daly
#NT_PW002    Tiwi
#NT_PW003    Arnhem
#NT_PW004    Carpentaria
#NT_PW005    Gregory
#NT_PW006    Barkly
#NT_PW007    Simpson
#NT_PW008    Lasseter
#NT_PW009    Tanami


## Metro Warning Areas
NT_ME001    Darwin Area
#NT_ME002    Kakadu
#NT_ME003    Litchfield
#NT_ME004    Uluru - Kata Tjuta
NT_ME005    Darwin and Surrounds
NT_ME006    Darwin
#NT_ME007    Litchfield
NT_ME008    Bynoe
NT_ME009    Cox Peninsula
NT_ME010    Palmerston
```

### Text-To-Speech
Text-To-Speech (TTS) support is not currently written into the stormcheck script, however placeholders still exist in the code from previous implementations, and can be used to re-enable the functionality if desired in the future.


## Running

To run the script, simply run 'stormcheck' with one option, being the state identifier required. For the example above this would be
```
stormcheck vk8
```

Additional options are available:
- Passing the --debug flag will output debugging messages whilst the script is executed
- Passing the --notx flag will run the script, but NOT key the radio to play the announcement.
- Passing the --local flag will play the audio locally if the --notx flag is given - this is only used for development.
Using both of these flags together therefore can be used for future development on a live node
```
stormcheck vk2 --debug --notx
```

Running on an IRLP node requires the script to be run as the 'repeater' user.

The script should be run periodically as a system cron task. Running every 5 to 10 minutes should ensure that changes to warnings are rapidly relayed to listeners.

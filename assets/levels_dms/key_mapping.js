const fs = require("fs");

const NOTES = "QAZWSXEDCRFVTGBYHNUJMIKLOP";
const PITCHES = [
  "C",
  "C#",
  "D",
  "D#",
  "E",
  "F",
  "F#",
  "G",
  "G#",
  "A",
  "A#",
  "B",
];

const MAPPINGS = {};
let i = 0;
let startOctave = 4;

for (const C of NOTES) {
  const mapping = PITCHES[i++] + startOctave;
  MAPPINGS[C] = mapping;

  if (i === PITCHES.length) {
    i = 0;
    startOctave++;
  }
}

fs.writeFileSync(
  "./assets/levels_dms/MAPPINGS.json",
  JSON.stringify(MAPPINGS, null, 2)
);

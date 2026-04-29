-- Lord of the Mysteries Database
-- This file contains data for Pathways, Sequences, Tarot Club Members, Deities, Artifacts, and Cathedrals.

CREATE DATABASE IF NOT EXISTS lord_of_the_mysteries;
USE lord_of_the_mysteries;


-- 1. TABLE STRUCTURES
-- Table: Pathways
CREATE TABLE IF NOT EXISTS pathways (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    starting_sequence VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table: Sequences
CREATE TABLE IF NOT EXISTS sequences (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pathway_id INT,
    sequence_number INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (pathway_id) REFERENCES pathways(id) ON DELETE CASCADE
);

-- Table: Deities
CREATE TABLE IF NOT EXISTS deities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    deity_type VARCHAR(50), -- True Deity, Outer Deity, Ancient God, Evil God
    pathway_id INT,
    status VARCHAR(100), -- Active, Fallen, Sealed
    description TEXT,
    FOREIGN KEY (pathway_id) REFERENCES pathways(id) ON DELETE SET NULL
);

-- Table: Tarot Club Members
CREATE TABLE IF NOT EXISTS tarot_club (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tarot_name VARCHAR(50) UNIQUE NOT NULL,
    real_name VARCHAR(100),
    pathway_id INT,
    sequence_number INT, -- Current/Peak Sequence
    FOREIGN KEY (pathway_id) REFERENCES pathways(id) ON DELETE SET NULL
);

-- Table: Artifacts
CREATE TABLE IF NOT EXISTS artifacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(20), -- e.g., 0-08
    name VARCHAR(255) NOT NULL,
    grade VARCHAR(20), -- Grade 0, 1, 2, 3
    description TEXT
);

-- Table: Cathedrals
CREATE TABLE IF NOT EXISTS cathedrals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    deity_id INT,
    FOREIGN KEY (deity_id) REFERENCES deities(id) ON DELETE SET NULL
);


-- 2. DATA POPULATION - PATHWAYS

INSERT INTO pathways (name, starting_sequence, description) VALUES
('The Fool', 'Seer', 'Pathway of Divination, Illusions, and Mystery.'),
('The Door', 'Apprentice', 'Pathway of Space, Travel, and Sealing.'),
('The Error', 'Marauder', 'Pathway of Theft, Deception, and Time.'),
('Visionary', 'Spectator', 'Pathway of Minds, Dreams, and Imagination.'),
('White Tower', 'Reader', 'Pathway of Knowledge, Analysis, and Omniscience.'),
('Tyrant', 'Sailor', 'Pathway of Storms, Sea, and Lightning.'),
('Sun', 'Bard', 'Pathway of Light, Purification, and Contracts.'),
('Darkness', 'Sleepless', 'Pathway of Night, Concealment, and Horror.'),
('Death', 'Corpse Collector', 'Pathway of Undeath, Souls, and Decay.'),
('Twilight Giant', 'Warrior', 'Pathway of Combat, Strength, and Dusk.'),
('Red Priest', 'Hunter', 'Pathway of Fire, War, and Conspiracies.'),
('Demoness', 'Assassin', 'Pathway of Seduction, Disease, and Destruction.'),
('Chained', 'Prisoner', 'Pathway of Self-control, Desire, and Curses.'),
('Abyss', 'Criminal', 'Pathway of Corruption, Devils, and Evil.'),
('Moon', 'Apothecary', 'Pathway of Life, Vampires, and the Moon.'),
('Mother', 'Planter', 'Pathway of Nature, Fertility, and Earth.'),
('Hermit', 'Mystery Pryer', 'Pathway of Mysticism, Secrets, and Knowledge.'),
('Paragon', 'Savant', 'Pathway of Technology, Invention, and Mechanics.'),
('Justiciar', 'Arbiter', 'Pathway of Law, Order, and Rules.'),
('Black Emperor', 'Lawyer', 'Pathway of Corruption, Distortion, and Order.'),
('Wheel of Fortune', 'Monster', 'Pathway of Luck, Fate, and Chaos.'),
('Hanged Man', 'Secrets Supplicant', 'Pathway of Sacrifice, Shadows, and Degeneration.');


-- 3. DATA POPULATION - SEQUENCES (220 TOTAL)

-- Fool/Seer
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(1, 9, 'Seer'), (1, 8, 'Clown'), (1, 7, 'Magician'), (1, 6, 'Faceless'), (1, 5, 'Nimblewright Master'),
(1, 4, 'Bizarro Sorcerer'), (1, 3, 'Scholar of Yore'), (1, 2, 'Miracle Invoker'), (1, 1, 'Attendant of Mysteries'), (1, 0, 'The Fool');

-- Door/Apprentice
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(2, 9, 'Apprentice'), (2, 8, 'Trickmaster'), (2, 7, 'Astrologer'), (2, 6, 'Traveler'), (2, 5, 'Recordsman'),
(2, 4, 'Secrets Sorcerer'), (2, 3, 'Wanderer'), (2, 2, 'Planeswalker'), (2, 1, 'Key of Stars'), (2, 0, 'The Door');

-- Error/Marauder
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(3, 9, 'Marauder'), (3, 8, 'Swindler'), (3, 7, 'Cryptologist'), (3, 6, 'Prometheus'), (3, 5, 'Mentor of Deceit'),
(3, 4, 'Parasite'), (3, 3, 'Mentor of Confusion'), (3, 2, 'Trojan Horse of Destiny'), (3, 1, 'Worm of Time'), (3, 0, 'The Error');

-- Visionary/Spectator
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(4, 9, 'Spectator'), (4, 8, 'Telepath'), (4, 7, 'Psychiatrist'), (4, 6, 'Hypnotist'), (4, 5, 'Dream Walker'),
(4, 4, 'Manipulator'), (4, 3, 'Dream Weaver'), (4, 2, 'Discerner'), (4, 1, 'Author'), (4, 0, 'Visionary');

-- White Tower/Reader
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(5, 9, 'Reader'), (5, 8, 'Archaeologist'), (5, 7, 'Polymath'), (5, 6, 'Scholar of Knowledge'), (5, 5, 'Cognizer'),
(5, 4, 'Prophet'), (5, 3, 'Lore Keeper'), (5, 2, 'Wisdom Angel'), (5, 1, 'Omniscient Eye'), (5, 0, 'White Tower');

-- Tyrant/Sailor
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(6, 9, 'Sailor'), (6, 8, 'Raging Guide'), (6, 7, 'Wind-blessed'), (6, 6, 'Storm Caller'), (6, 5, 'Ocean Songster'),
(6, 4, 'Cataclysmic Interdictor'), (6, 3, 'Sea King'), (6, 2, 'Calamity'), (6, 1, 'Thunder God'), (6, 0, 'Tyrant');

-- Sun/Bard
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(7, 9, 'Bard'), (7, 8, 'Light Supplicant'), (7, 7, 'Solar High Priest'), (7, 6, 'Notary'), (7, 5, 'Priest of Light'),
(7, 4, 'Unshadowed'), (7, 3, 'Justice Mentor'), (7, 2, 'Lightseeker'), (7, 1, 'White Angel'), (7, 0, 'Sun');

-- Darkness/Sleepless
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(8, 9, 'Sleepless'), (8, 8, 'Midnight Poet'), (8, 7, 'Nightmare'), (8, 6, 'Soul Guide'), (8, 5, 'Spirit Medium'),
(8, 4, 'Nightwatcher'), (8, 3, 'Horror Bishop'), (8, 2, 'Servant of Concealment'), (8, 1, 'Knight of Misfortune'), (8, 0, 'Evernight');

-- Death/Corpse Collector
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(9, 9, 'Corpse Collector'), (9, 8, 'Gravedigger'), (9, 7, 'Spirit Medium'), (9, 6, 'Spirit Guide'), (9, 5, 'Gatekeeper'),
(9, 4, 'Undying'), (9, 3, 'Ferryman'), (9, 2, 'Death Angel'), (9, 1, 'Pale Emperor'), (9, 0, 'Death');

-- Twilight Giant/Warrior
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(10, 9, 'Warrior'), (10, 8, 'Pugilist'), (10, 7, 'Weapon Master'), (10, 6, 'Dawn Paladin'), (10, 5, 'Guardian'),
(10, 4, 'Demon Hunter'), (10, 3, 'Silver Knight'), (10, 2, 'Glory Giver'), (10, 1, 'Hand of God'), (10, 0, 'Twilight Giant');

-- Red Priest/Hunter
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(11, 9, 'Hunter'), (11, 8, 'Provoker'), (11, 7, 'Pyromaniac'), (11, 6, 'Conspirator'), (11, 5, 'Reaper'),
(11, 4, 'Iron-blooded Knight'), (11, 3, 'War Bishop'), (11, 2, 'Weather Warlock'), (11, 1, 'Conqueror'), (11, 0, 'Red Priest');

-- Demoness/Assassin
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(12, 9, 'Assassin'), (12, 8, 'Instigator'), (12, 7, 'Witch'), (12, 6, 'Pleasure'), (12, 5, 'Affliction'),
(12, 4, 'Unaging'), (12, 3, 'Despair'), (12, 2, 'Catastrophe'), (12, 1, 'Apocalypse'), (12, 0, 'Demoness');

-- Chained/Prisoner
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(13, 9, 'Prisoner'), (13, 8, 'Lunatic'), (13, 7, 'Werewolf'), (13, 6, 'Zombie'), (13, 5, 'Wraith'),
(13, 4, 'Puppet'), (13, 3, 'Cursed One'), (13, 2, 'Sage'), (13, 1, 'Abomination'), (13, 0, 'Chained God');

-- Abyss/Criminal
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(14, 9, 'Criminal'), (14, 8, 'Cold-blooded'), (14, 7, 'Serial Killer'), (14, 6, 'Devil'), (14, 5, 'Desire Apostle'),
(14, 4, 'Demon'), (14, 3, 'Frenzied'), (14, 2, 'Blood Duke'), (14, 1, 'Prince of the Abyss'), (14, 0, 'Abyss');

-- Moon/Apothecary
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(15, 9, 'Apothecary'), (15, 8, 'Beast Tamer'), (15, 7, 'Vampire'), (15, 6, 'Viscount'), (15, 5, 'Scarlet Scholar'),
(15, 4, 'Shaman'), (15, 3, 'High-Sequence Moon'), (15, 2, 'Moon Giver'), (15, 1, 'Pale Mother'), (15, 0, 'Moon');

-- Mother/Planter
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(16, 9, 'Planter'), (16, 8, 'Farm Manager'), (16, 7, 'Harvest Priest'), (16, 6, 'Biology Teacher'), (16, 5, 'Lifegiver'),
(16, 4, 'Nature-Mage'), (16, 3, 'Weaver of Life'), (16, 2, 'Fecund Angel'), (16, 1, 'Earth Mother'), (16, 0, 'Mother');

-- Hermit/Mystery Pryer
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(17, 9, 'Mystery Pryer'), (17, 8, 'Melee Scholar'), (17, 7, 'Warlock'), (17, 6, 'Scroll Master'), (17, 5, 'Astrologist'),
(17, 4, 'Mysticologist'), (17, 3, 'Clairvoyant'), (17, 2, 'Sage'), (17, 1, 'Knowledge Emperor'), (17, 0, 'Hermit');

-- Paragon/Savant
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(18, 9, 'Savant'), (18, 8, 'Archaeologist'), (18, 7, 'Appraiser'), (18, 6, 'Artisan'), (18, 5, 'Astronomer'),
(18, 4, 'Alchemist'), (18, 3, 'Arcane Scholar'), (18, 2, 'Knowledge Angel'), (18, 1, 'God of Steam'), (18, 0, 'Paragon');

-- Justiciar/Arbiter
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(19, 9, 'Arbiter'), (19, 8, 'Sheriff'), (19, 7, 'Interrogator'), (19, 6, 'Judge'), (19, 5, 'Disciplinary Paladin'),
(19, 4, 'Imperative Mage'), (19, 3, 'Chaos Hunter'), (19, 2, 'Balancer'), (19, 1, 'Hand of Order'), (19, 0, 'Justiciar');

-- Black Emperor/Lawyer
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(20, 9, 'Lawyer'), (20, 8, 'Barbarian'), (20, 7, 'Briber'), (20, 6, 'Baron of Corruption'), (20, 5, 'Mentor of Disorder'),
(20, 4, 'Earl of the Fallen'), (20, 3, 'Frenzied Mage'), (20, 2, 'Duke of Entropy'), (20, 1, 'Prince of Abolition'), (20, 0, 'Black Emperor');

-- Wheel of Fortune/Monster
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(21, 9, 'Monster'), (21, 8, 'Robot'), (21, 7, 'Lucky One'), (21, 6, 'Calamity Priest'), (21, 5, 'Winner'),
(21, 4, 'Misfortune Mage'), (21, 3, 'Chaos Walker'), (21, 2, 'Snake of Mercury'), (21, 1, 'Key of Light'), (21, 0, 'Wheel of Fortune');

-- Hanged Man/Secrets Supplicant
INSERT INTO sequences (pathway_id, sequence_number, name) VALUES
(22, 9, 'Secrets Supplicant'), (22, 8, 'Listener'), (22, 7, 'Shadow Ascetic'), (22, 6, 'Rose Bishop'), (22, 5, 'Shepherd'),
(22, 4, 'Black Knight'), (22, 3, 'Trinity'), (22, 2, 'Profane Presbyter'), (22, 1, 'Dark Angel'), (22, 0, 'Hanged Man');

-- 4. DATA POPULATION - DEITIES

INSERT INTO deities (name, deity_type, pathway_id, status, description) VALUES
('Evernight Goddess', 'True Deity', 8, 'Active', 'The Goddess of Night, Concealment, and Misfortune.'),
('Lord of Storms', 'True Deity', 6, 'Active', 'The God of Sea and Lightning.'),
('Eternal Blazing Sun', 'True Deity', 7, 'Active', 'The God of Sun and Light.'),
('God of Knowledge and Wisdom', 'True Deity', 5, 'Active', 'The God of Omniscience and Omnipotence.'),
('Earth Mother', 'True Deity', 16, 'Active', 'The Goddess of Life and Nature (revealed to be Lilith).'),
('God of Steam and Machinery', 'True Deity', 18, 'Active', 'The God of Technology and Craft.'),
('God of Combat', 'True Deity', 10, 'Fallen', 'The God of War and Strength.'),
('The Fool', 'True Deity', 1, 'Active', 'Klein Moretti, the New God of the Great Fog.'),
('True Creator', 'Evil God', 22, 'Active', 'The deity worshipped by the Aurora Order.'),
('Primordial Demoness', 'Evil God', 12, 'Active', 'The deity of the Demoness Sect.'),
('Mother Goddess of Depravity', 'Outer Deity', 15, 'Active', 'Major cosmic horror from outside Earth.'),
('Mother Tree of Desire', 'Outer Deity', 13, 'Active', 'Cosmic horror associated with the Chained and Abyss pathways.'),
('Son of Chaos', 'Outer Deity', 19, 'Sealed', 'Trapped within the Magic Wishing Lamp.');


-- 5. DATA POPULATION - TAROT CLUB

INSERT INTO tarot_club (tarot_name, real_name, pathway_id, sequence_number) VALUES
('The Fool', 'Klein Moretti', 1, 0),
('The Justice', 'Audrey Hall', 4, 2),
('The Hanged Man', 'Alger Wilson', 22, 2),
('The Sun', 'Derrick Berg', 7, 2),
('The Magician', 'Fors Wall', 2, 1),
('The Moon', 'Emlyn White', 15, 2),
('The Hermit', 'Cattleya', 17, 3),
('The Star', 'Leonard Mitchell', 8, 3),
('The Judgement', 'Xio Derecha', 19, 3);


-- 6. DATA POPULATION - ARTIFACTS


INSERT INTO artifacts (code, name, grade, description) VALUES
('0-08', 'Quill of Alzuhod', 'Grade 0', 'A quill that makes anything it writes come true in a reasonable manner.'),
('0-02', 'Trunsoest Brass Book', 'Grade 0', 'A living book of laws that enforces rules within its domain.'),
('0-05', 'Magic Wishing Lamp', 'Grade 0', 'Contains the Genie, a manifestation of the Son of Chaos.'),
('Grade 1', 'Creeping Hunger', 'Grade 1', 'A glove that can graze Beyonder souls and use their powers.'),
('Secondary', 'Arrodes', 'Grade 1', 'A magical mirror that answers questions but demands embarrassing truths in return.'),
('Grade 1', 'Leymano''s Travels', 'Grade 1', 'A notebook that can record and replicate Beyonder powers.'),
('0-17', 'Death''s Bell', 'Grade 0', 'An artifact of the Death pathway stored in the Evernight Church.');


-- 7. DATA POPULATION - CATHEDRALS

-- Get deity IDs (assuming they are 1-based and match the order of insertion)
INSERT INTO cathedrals (name, location, deity_id) VALUES
('Saint Samuel Cathedral', 'Backlund, North District', 1),
('Saint Wind Cathedral', 'Backlund, Cherwood District', 2),
('Cathedral of Serenity', 'Reynold City (Holy Place)', 1),
('Saint Pualis Cathedral', 'Backlund', 5),
('Genesis Cathedral', 'Giant King''s Court', 9);

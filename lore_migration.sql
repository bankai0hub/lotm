USE lord_of_the_mysteries;

-- 1. SCHEMA UPDATES
ALTER TABLE sequences ADD COLUMN description TEXT;
ALTER TABLE sequences ADD COLUMN abilities TEXT;
ALTER TABLE sequences ADD COLUMN acting_method TEXT;

ALTER TABLE tarot_club ADD COLUMN status VARCHAR(100);
ALTER TABLE tarot_club ADD COLUMN honorific_name VARCHAR(255);
ALTER TABLE tarot_club ADD COLUMN description TEXT;

-- 2. POPULATE TAROT CLUB DOSSIERS
UPDATE tarot_club SET status = 'Angel', honorific_name = 'The Embodiment of Justice', description = 'Audrey Hall, a key member who provides psychological support and vast resources.' WHERE tarot_name = 'The Justice';
UPDATE tarot_club SET status = 'Angel', honorific_name = 'The Profane Presbyter', description = 'Alger Wilson, a seasoned sailor and strategist who commands the sea.' WHERE tarot_name = 'The Hanged Man';
UPDATE tarot_club SET status = 'Angel', honorific_name = 'The Sun of Holiness', description = 'Derrick Berg, the light of the City of Silver who brings purification.' WHERE tarot_name = 'The Sun';
UPDATE tarot_club SET status = 'Angel', honorific_name = 'Angel of Stars', description = 'Fors Wall, a traveler of the cosmos and key archivist of mysteries.' WHERE tarot_name = 'The Magician';
UPDATE tarot_club SET status = 'Angel', honorific_name = 'Sage of Knowledge', description = 'Cattleya, the leader of the Admiral of Stars and a seeker of hidden mystical truths.' WHERE tarot_name = 'The Hermit';
UPDATE tarot_club SET status = 'Angel', honorific_name = 'The Servant of Concealment', description = 'Leonard Mitchell, a high-ranking Nighthawk with a nested angel soul.' WHERE tarot_name = 'The Star';
UPDATE tarot_club SET status = 'Angel', honorific_name = 'The Balancer', description = 'Xio Derecha, an enforcer of law and order in the underground and beyond.' WHERE tarot_name = 'The Judgement';

-- 3. POPULATE SEQUENCES - THE FOOL
UPDATE sequences SET description = 'Gains spirit vision and basic divination skills.', abilities = 'Spirit Vision, Divination', acting_method = 'Observe and guide while remaining hidden.' WHERE pathway_id = 1 AND sequence_number = 9;
UPDATE sequences SET description = 'Acquires extraordinary balance and paper transformation skills.', abilities = 'Paper Figurine Substitution', acting_method = 'Wear a smile in the face of despair.' WHERE pathway_id = 1 AND sequence_number = 8;
UPDATE sequences SET description = 'Master of stage magic and fire tricks.', abilities = 'Flaming Jump, Air Bullet', acting_method = 'Perform before an audience with absolute control.' WHERE pathway_id = 1 AND sequence_number = 7;
UPDATE sequences SET description = 'Can perfectly alter facial features and body shape.', abilities = 'Perfect Disguise, Flesh Molding', acting_method = 'Assume many roles while losing none of oneself.' WHERE pathway_id = 1 AND sequence_number = 6;
UPDATE sequences SET description = 'Can control spirit body threads and turn entities into puppets.', abilities = 'Spirit Body Thread Manipulation', acting_method = 'Control the strings from behind the scenes.' WHERE pathway_id = 1 AND sequence_number = 5;
UPDATE sequences SET description = 'Can swap locations with puppets and create strange phenomena.', abilities = 'Bizarro Transformation, Blink', acting_method = 'Spread fear and mystery through abnormal events.' WHERE pathway_id = 1 AND sequence_number = 4;
UPDATE sequences SET description = 'Access to the past through historical projections.', abilities = 'Historical Projection, Summoning', acting_method = 'Preserve and utilize the discarded history.' WHERE pathway_id = 1 AND sequence_number = 3;
UPDATE sequences SET description = 'Can perform miracles and fulfill wishes.', abilities = 'Miracle Realization, Resurrection', acting_method = 'Grant wishes but always demand a price.' WHERE pathway_id = 1 AND sequence_number = 2;
UPDATE sequences SET description = 'Direct attendant of the mysteries in the Sefirah Castle.', abilities = 'Fog Manipulation, Hidden State', acting_method = 'Serve the mysteries while becoming one.' WHERE pathway_id = 1 AND sequence_number = 1;

-- 4. POPULATE SEQUENCES - THE DOOR
UPDATE sequences SET description = 'Basic space manipulation and lock-picking.', abilities = 'Open, Close, Small Door', acting_method = 'Travel and learn what is hidden.' WHERE pathway_id = 2 AND sequence_number = 9;
UPDATE sequences SET description = 'Master of minor tricks and evasions.', abilities = 'Trick, Confusion', acting_method = 'Deceive through skill and travel.' WHERE pathway_id = 2 AND sequence_number = 8;
UPDATE sequences SET description = 'Can predict celestial movements and destiny.', abilities = 'Astrology, Star Vision', acting_method = 'Watch the stars to find the paths.' WHERE pathway_id = 2 AND sequence_number = 7;
UPDATE sequences SET description = 'Can travel long distances and crossing Spirit World.', abilities = 'Teleportation, Spiritual Travel', acting_method = 'Never stay in one place long enough to be caught.' WHERE pathway_id = 2 AND sequence_number = 6;
UPDATE sequences SET description = 'Records Beyonder powers into books or scrolls.', abilities = 'Record, Replicate', acting_method = 'Collect the world''s knowledge in travel.' WHERE pathway_id = 2 AND sequence_number = 5;

-- i need to add more pathways.
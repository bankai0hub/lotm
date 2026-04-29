import { motion } from 'framer-motion';

const Home = () => {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', minHeight: '70vh', textAlign: 'center' }}>
      <motion.h1 
        initial={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 1 }}
        style={{ fontSize: '4rem', marginBottom: '20px', textShadow: '0 0 20px var(--gold-glow)' }}
      >
        Sefirah Castle
      </motion.h1>
      
      <motion.p
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 1, delay: 0.5 }}
        style={{ fontSize: '1.2rem', maxWidth: '600px', lineHeight: '1.8', color: '#ccc' }}
      >
        Welcome to the gathering place above the spirit world. Here lies the repository of knowledge regarding the 22 Pathways of the Divine, the secretive Tarot Club, and the mysterious Artifacts of the 5th Epoch.
      </motion.p>
      
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 1, delay: 1 }}
        style={{ marginTop: '40px' }}
      >
        <a href="#/pathways" className="glass-panel gold-border" style={{ padding: '15px 30px', fontSize: '1.1rem', cursor: 'pointer', display: 'inline-block' }}>
          Explore Pathways
        </a>
      </motion.div>
    </div>
  );
};

export default Home;

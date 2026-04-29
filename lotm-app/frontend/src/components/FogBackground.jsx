import { motion } from 'framer-motion';

const FogBackground = () => {
  return (
    <div
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        width: '100vw',
        height: '100vh',
        zIndex: -1,
        overflow: 'hidden',
        backgroundColor: '#0a0a0a',
      }}
    >
      <motion.div
        animate={{
          x: ['-50%', '0%'],
          y: ['-10%', '0%', '-10%'],
        }}
        transition={{
          x: {
            repeat: Infinity,
            repeatType: 'reverse',
            duration: 120,
            ease: 'linear',
          },
          y: {
            repeat: Infinity,
            repeatType: 'reverse',
            duration: 40,
            ease: 'easeInOut',
          },
        }}
        style={{
          position: 'absolute',
          top: '-50%',
          left: '-50%',
          width: '200%',
          height: '200%',
          background: 'radial-gradient(ellipse at center, rgba(80,80,90,0.1) 0%, rgba(10,10,10,0) 70%)',
          filter: 'blur(60px)',
          opacity: 0.8,
        }}
      />
      <motion.div
        animate={{
          x: ['0%', '-50%'],
          y: ['0%', '-10%', '0%'],
        }}
        transition={{
          x: {
            repeat: Infinity,
            repeatType: 'reverse',
            duration: 90,
            ease: 'linear',
          },
          y: {
            repeat: Infinity,
            repeatType: 'reverse',
            duration: 35,
            ease: 'easeInOut',
          },
        }}
        style={{
          position: 'absolute',
          top: '-20%',
          left: '-20%',
          width: '150%',
          height: '150%',
          background: 'radial-gradient(circle at center, rgba(120,120,130,0.05) 0%, rgba(10,10,10,0) 60%)',
          filter: 'blur(40px)',
          opacity: 0.6,
        }}
      />
    </div>
  );
};

export default FogBackground;

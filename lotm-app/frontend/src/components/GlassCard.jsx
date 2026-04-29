import { motion } from 'framer-motion';

const GlassCard = ({ children, title, subtitle, onClick, style, delay = 0 }) => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.5, delay }}
      whileHover={{ y: -5, boxShadow: '0 10px 25px rgba(212, 175, 55, 0.2)' }}
      className="glass-panel gold-border"
      onClick={onClick}
      style={{
        padding: '25px',
        cursor: onClick ? 'pointer' : 'default',
        display: 'flex',
        flexDirection: 'column',
        gap: '10px',
        ...style
      }}
    >
      {title && <h3 style={{ margin: 0, fontSize: '1.4rem' }}>{title}</h3>}
      {subtitle && <p style={{ margin: 0, color: '#aaa', fontSize: '0.9rem' }}>{subtitle}</p>}
      <div style={{ marginTop: '10px', color: '#e0e0e0', lineHeight: '1.6' }}>
        {children}
      </div>
    </motion.div>
  );
};

export default GlassCard;

import { Compass, Book, Users, Scroll, Shield } from 'lucide-react';
import { motion } from 'framer-motion';

const Navbar = ({ currentPath }) => {
  const navItems = [
    { name: 'Sefirah Castle', path: '#/', icon: <Compass size={20} /> },
    { name: 'Pathways', path: '#/pathways', icon: <Scroll size={20} /> },
    { name: 'Tarot Club', path: '#/members', icon: <Users size={20} /> },
    { name: 'Artifacts', path: '#/artifacts', icon: <Book size={20} /> },
    { name: 'Admin', path: '#/admin', icon: <Shield size={20} /> },
  ];

  return (
    <nav style={{
      position: 'fixed',
      top: 0,
      width: '100%',
      zIndex: 100,
      padding: '15px 30px',
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center',
      borderBottom: '1px solid rgba(212, 175, 55, 0.2)'
    }} className="glass-panel">
      <div style={{ fontFamily: 'var(--heading-font)', fontSize: '1.5rem', color: 'var(--gold)', display: 'flex', alignItems: 'center', gap: '10px' }}>
        <Compass color="var(--gold)" />
        <span>LotM Wiki</span>
      </div>
      
      <div style={{ display: 'flex', gap: '20px' }}>
        {navItems.map((item) => (
          <a
            key={item.name}
            href={item.path}
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              color: currentPath === item.path ? 'var(--gold)' : 'var(--text-color)',
              transition: 'color 0.3s ease',
              fontFamily: 'var(--primary-font)',
              fontWeight: 500
            }}
          >
            {item.icon}
            {item.name}
            {currentPath === item.path && (
              <motion.div
                layoutId="underline"
                style={{
                  position: 'absolute',
                  bottom: -15,
                  height: '2px',
                  backgroundColor: 'var(--gold)',
                  width: '100%',
                }}
              />
            )}
          </a>
        ))}
      </div>
    </nav>
  );
};

export default Navbar;

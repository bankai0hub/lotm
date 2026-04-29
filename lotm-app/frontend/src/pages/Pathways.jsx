import { useState, useEffect } from 'react';
import { api } from '../services/api';
import GlassCard from '../components/GlassCard';
import { motion, AnimatePresence } from 'framer-motion';

const Pathways = () => {
  const [pathways, setPathways] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [expandedId, setExpandedId] = useState(null);
  const [sequences, setSequences] = useState({});

  useEffect(() => {
    const fetchPathways = async () => {
      try {
        const data = await api.getPathways();
        setPathways(data);
      } catch (err) {
        setError('Failed to fetch pathways. Make sure backend is running.');
      } finally {
        setLoading(false);
      }
    };
    fetchPathways();
  }, []);

  const handleExpand = async (id) => {
    if (expandedId === id) {
      setExpandedId(null);
      return;
    }
    setExpandedId(id);
    if (!sequences[id]) {
      try {
        const data = await api.getSequences(id);
        setSequences(prev => ({ ...prev, [id]: data.sort((a,b) => b.sequence_number - a.sequence_number) }));
      } catch (err) {
        console.error(err);
      }
    }
  };

  if (loading) return <div className="spinner"></div>;
  if (error) return <div style={{ color: '#ff6b6b', textAlign: 'center' }}>{error}</div>;

  return (
    <div>
      <h2 style={{ fontSize: '2.5rem', marginBottom: '30px', textAlign: 'center' }}>The 22 Divine Pathways</h2>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: '20px' }}>
        {pathways.map((p, i) => (
          <GlassCard 
            key={p.id} 
            title={p.name} 
            subtitle={`Starting Sequence: ${p.starting_sequence}`}
            delay={i * 0.05}
            onClick={() => handleExpand(p.id)}
          >
            <p>{p.description}</p>
            <AnimatePresence>
              {expandedId === p.id && (
                <motion.div
                  initial={{ height: 0, opacity: 0 }}
                  animate={{ height: 'auto', opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }}
                  style={{ overflow: 'hidden', marginTop: '15px', borderTop: '1px solid rgba(212,175,55,0.2)', paddingTop: '10px' }}
                >
                  <h4 style={{ color: 'var(--gold)', marginBottom: '10px' }}>Sequences</h4>
                  {sequences[p.id] ? (
                    <ul style={{ listStyle: 'none', padding: 0 }}>
                      {sequences[p.id].map(seq => (
                        <li key={seq.id} style={{ padding: '5px 0', borderBottom: '1px solid rgba(255,255,255,0.05)', fontSize: '0.9rem' }}>
                          Seq {seq.sequence_number}: {seq.name}
                        </li>
                      ))}
                    </ul>
                  ) : (
                    <div className="spinner" style={{ width: '20px', height: '20px', borderWidth: '2px' }}></div>
                  )}
                </motion.div>
              )}
            </AnimatePresence>
          </GlassCard>
        ))}
      </div>
    </div>
  );
};

export default Pathways;

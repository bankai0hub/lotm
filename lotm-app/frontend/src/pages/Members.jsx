import { useState, useEffect } from 'react';
import { api } from '../services/api';
import GlassCard from '../components/GlassCard';

const Members = () => {
  const [members, setMembers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchMembers = async () => {
      try {
        const data = await api.getMembers();
        setMembers(data);
      } catch (err) {
        setError('Failed to fetch Tarot Club members.');
      } finally {
        setLoading(false);
      }
    };
    fetchMembers();
  }, []);

  if (loading) return <div className="spinner"></div>;
  if (error) return <div style={{ color: '#ff6b6b', textAlign: 'center' }}>{error}</div>;

  return (
    <div>
      <h2 style={{ fontSize: '2.5rem', marginBottom: '30px', textAlign: 'center' }}>The Tarot Club</h2>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '20px' }}>
        {members.map((m, i) => (
          <GlassCard 
            key={m.id} 
            title={m.tarot_name} 
            subtitle={`Real Name: ${m.real_name || 'Unknown'}`}
            delay={i * 0.1}
          >
            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', marginTop: '10px' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', borderBottom: '1px solid rgba(255,255,255,0.1)', paddingBottom: '5px' }}>
                <span style={{ color: '#aaa' }}>Pathway ID:</span>
                <span>{m.pathway_id || 'Unknown'}</span>
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                <span style={{ color: '#aaa' }}>Current Sequence:</span>
                <span>{m.sequence_number !== "null" ? m.sequence_number : 'Unknown'}</span>
              </div>
            </div>
          </GlassCard>
        ))}
      </div>
    </div>
  );
};

export default Members;

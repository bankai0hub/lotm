import { useState, useEffect } from 'react';
import { api } from '../services/api';
import GlassCard from '../components/GlassCard';

const Artifacts = () => {
  const [artifacts, setArtifacts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchArtifacts = async () => {
      try {
        const data = await api.getArtifacts();
        setArtifacts(data);
      } catch (err) {
        setError('Failed to fetch Artifacts.');
      } finally {
        setLoading(false);
      }
    };
    fetchArtifacts();
  }, []);

  if (loading) return <div className="spinner"></div>;
  if (error) return <div style={{ color: '#ff6b6b', textAlign: 'center' }}>{error}</div>;

  return (
    <div>
      <h2 style={{ fontSize: '2.5rem', marginBottom: '30px', textAlign: 'center' }}>Sealed Artifacts</h2>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: '20px' }}>
        {artifacts.map((a, i) => (
          <GlassCard 
            key={a.id} 
            title={a.name} 
            subtitle={`Code: ${a.code} | Grade: ${a.grade}`}
            delay={i * 0.1}
          >
            <p>{a.description}</p>
          </GlassCard>
        ))}
      </div>
    </div>
  );
};

export default Artifacts;

import { useState } from 'react';
import { api } from '../services/api';
import GlassCard from '../components/GlassCard';
import { Shield } from 'lucide-react';

const Admin = () => {
  const [password, setPassword] = useState('');
  const [status, setStatus] = useState('');
  const [loading, setLoading] = useState(false);

  const handlePing = async (e) => {
    e.preventDefault();
    setLoading(true);
    setStatus('');
    try {
      const response = await api.insertData(password, { test: true });
      setStatus(`Success: ${response.message}`);
    } catch (err) {
      if (err.response && err.response.status === 401) {
        setStatus('Error: Unauthorized. Incorrect Password.');
      } else {
        setStatus('Error: Failed to connect to server.');
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '60vh' }}>
      <GlassCard style={{ width: '100%', maxWidth: '400px', textAlign: 'center' }}>
        <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '20px' }}>
          <Shield size={48} color="var(--gold)" />
        </div>
        <h2 style={{ marginBottom: '20px' }}>Admin Access</h2>
        
        <form onSubmit={handlePing} style={{ display: 'flex', flexDirection: 'column', gap: '15px' }}>
          <input 
            type="password" 
            placeholder="Enter Sefirah Password" 
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            style={{
              padding: '12px',
              borderRadius: '6px',
              border: '1px solid var(--glass-border)',
              background: 'rgba(0,0,0,0.5)',
              color: 'var(--text-color)',
              outline: 'none',
              fontFamily: 'var(--primary-font)',
              fontSize: '1rem'
            }}
          />
          <button 
            type="submit"
            disabled={loading}
            style={{
              padding: '12px',
              borderRadius: '6px',
              border: '1px solid var(--gold)',
              background: 'var(--gold-glow)',
              color: 'var(--text-color)',
              fontWeight: 'bold',
              cursor: 'pointer',
              transition: 'all 0.3s ease',
              fontFamily: 'var(--primary-font)',
              fontSize: '1rem'
            }}
          >
            {loading ? 'Authenticating...' : 'Authenticate & Ping Server'}
          </button>
        </form>
        
        {status && (
          <div style={{ 
            marginTop: '20px', 
            padding: '10px', 
            borderRadius: '4px',
            backgroundColor: status.includes('Success') ? 'rgba(0, 255, 0, 0.1)' : 'rgba(255, 0, 0, 0.1)',
            color: status.includes('Success') ? '#4ade80' : '#f87171'
          }}>
            {status}
          </div>
        )}
      </GlassCard>
    </div>
  );
};

export default Admin;

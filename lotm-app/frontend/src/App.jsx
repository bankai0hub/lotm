import { useState, useEffect } from 'react';
import FogBackground from './components/FogBackground';
import Navbar from './components/Navbar';
import Home from './pages/Home';
import Pathways from './pages/Pathways';
import Members from './pages/Members';
import Artifacts from './pages/Artifacts';
import Admin from './pages/Admin';

function App() {
  const [currentPath, setCurrentPath] = useState(window.location.hash || '#/');

  useEffect(() => {
    const handleHashChange = () => {
      setCurrentPath(window.location.hash || '#/');
    };

    window.addEventListener('hashchange', handleHashChange);
    return () => window.removeEventListener('hashchange', handleHashChange);
  }, []);

  const renderPage = () => {
    switch (currentPath) {
      case '#/':
        return <Home />;
      case '#/pathways':
        return <Pathways />;
      case '#/members':
        return <Members />;
      case '#/artifacts':
        return <Artifacts />;
      case '#/admin':
        return <Admin />;
      default:
        return <Home />;
    }
  };

  return (
    <div className="app-container">
      <FogBackground />
      <Navbar currentPath={currentPath} />
      <main className="content-wrapper">
        {renderPage()}
      </main>
    </div>
  );
}

export default App;

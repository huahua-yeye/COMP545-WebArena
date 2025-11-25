// Simple test version - used to diagnose blank screen issues
import { useState } from 'react';

export default function App() {
  const [message, setMessage] = useState('Frontend is working!');

  return (
    <div style={{
      padding: '40px',
      background: '#000',
      color: '#CCFF00',
      minHeight: '100vh',
      fontFamily: 'monospace'
    }}>
      <h1 style={{ fontSize: '48px', marginBottom: '20px' }}>🎵 ACIDWAVE TEST</h1>
      <p style={{ fontSize: '24px' }}>{message}</p>

      <div style={{ marginTop: '40px' }}>
        <h2>Diagnostic Info:</h2>
        <ul style={{ fontSize: '14px', lineHeight: '2' }}>
          <li>✅ React is loaded</li>
          <li>✅ Component is rendering</li>
          <li>✅ State is working</li>
        </ul>
      </div>

      <button
        onClick={() => setMessage('Button clicked! Everything works!')}
        style={{
          marginTop: '20px',
          padding: '10px 20px',
          background: '#CCFF00',
          color: '#000',
          border: 'none',
          fontSize: '16px',
          cursor: 'pointer',
          fontWeight: 'bold'
        }}
      >
        TEST BUTTON
      </button>

      <div style={{ marginTop: '40px', padding: '20px', border: '2px solid #CCFF00' }}>
        <h3>Next Steps:</h3>
        <ol style={{ fontSize: '14px', lineHeight: '2' }}>
          <li>If you see this, React is working ✅</li>
          <li>Open browser console (F12) to check for errors</li>
          <li>We'll fix the main App.jsx step by step</li>
        </ol>
      </div>
    </div>
  );
}

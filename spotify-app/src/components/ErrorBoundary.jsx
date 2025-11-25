import React from 'react';

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null, errorInfo: null };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error('ErrorBoundary caught an error:', error, errorInfo);
    this.setState({
      error,
      errorInfo
    });
  }

  render() {
    if (this.state.hasError) {
      return (
        <div style={{
          padding: '40px',
          background: '#000',
          color: '#ff0000',
          minHeight: '100vh',
          fontFamily: 'monospace'
        }}>
          <h1 style={{ color: '#CCFF00', marginBottom: '20px' }}>⚠️ APPLICATION ERROR</h1>

          <div style={{
            background: '#111',
            border: '2px solid #ff0000',
            padding: '20px',
            marginBottom: '20px'
          }}>
            <h2 style={{ color: '#ff0000' }}>Error Message:</h2>
            <pre style={{
              color: '#fff',
              fontSize: '14px',
              whiteSpace: 'pre-wrap',
              wordBreak: 'break-word'
            }}>
              {this.state.error?.toString()}
            </pre>
          </div>

          {this.state.errorInfo && (
            <div style={{
              background: '#111',
              border: '1px solid #333',
              padding: '20px',
              marginBottom: '20px',
              maxHeight: '300px',
              overflow: 'auto'
            }}>
              <h2 style={{ color: '#CCFF00' }}>Component Stack:</h2>
              <pre style={{
                color: '#888',
                fontSize: '12px',
                whiteSpace: 'pre-wrap'
              }}>
                {this.state.errorInfo.componentStack}
              </pre>
            </div>
          )}

          <div style={{ marginTop: '30px' }}>
            <button
              onClick={() => window.location.reload()}
              style={{
                padding: '15px 30px',
                background: '#CCFF00',
                color: '#000',
                border: 'none',
                fontSize: '16px',
                fontWeight: 'bold',
                cursor: 'pointer',
                marginRight: '10px'
              }}
            >
              RELOAD PAGE
            </button>

            <button
              onClick={() => {
                this.setState({ hasError: false, error: null, errorInfo: null });
              }}
              style={{
                padding: '15px 30px',
                background: '#333',
                color: '#fff',
                border: '1px solid #666',
                fontSize: '16px',
                fontWeight: 'bold',
                cursor: 'pointer'
              }}
            >
              TRY AGAIN
            </button>
          </div>

          <div style={{
            marginTop: '40px',
            padding: '20px',
            background: '#111',
            border: '1px solid #333'
          }}>
            <h3 style={{ color: '#CCFF00' }}>Common Solutions:</h3>
            <ul style={{ fontSize: '14px', lineHeight: '2', color: '#888' }}>
              <li>Check browser console (F12) for more details</li>
              <li>Make sure backend is running (npm run dev in backend/)</li>
              <li>Verify all dependencies are installed (npm install)</li>
              <li>Check that all required files exist (hooks, components, services)</li>
            </ul>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}

export default ErrorBoundary;

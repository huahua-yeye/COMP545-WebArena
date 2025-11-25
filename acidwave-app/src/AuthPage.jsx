import React, { useState } from 'react';
import { User, Lock, Mail, LogIn, UserPlus, X } from 'lucide-react';

const ACID_GREEN = "#CCFF00";
const ACID_PINK = "#FF00FF";

const ChromeButton = ({ children, onClick, className = "", active = false, type = "button" }) => (
  <button
    type={type}
    onClick={onClick}
    className={`
      relative px-6 py-3 font-bold text-sm uppercase tracking-widest transition-all
      border border-transparent hover:scale-105 active:scale-95
      ${active
        ? `bg-[#CCFF00] text-black shadow-[0_0_15px_#CCFF00]`
        : `bg-gradient-to-b from-gray-100 via-gray-300 to-gray-400 text-black hover:brightness-110`
      }
      ${className}
    `}
    style={{ clipPath: 'polygon(10% 0, 100% 0, 100% 80%, 90% 100%, 0 100%, 0 20%)' }}
  >
    {children}
  </button>
);

export default function AuthPage({ onLogin, onClose }) {
  const [isLogin, setIsLogin] = useState(true);
  const [formData, setFormData] = useState({
    username: '',
    email: '',
    password: '',
    confirmPassword: ''
  });
  const [errors, setErrors] = useState({});

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
    // Clear error when user types
    if (errors[name]) {
      setErrors(prev => ({ ...prev, [name]: '' }));
    }
  };

  const validateForm = () => {
    const newErrors = {};

    if (!formData.username.trim()) {
      newErrors.username = 'USERNAME_REQUIRED';
    } else if (formData.username.length < 3) {
      newErrors.username = 'USERNAME_TOO_SHORT';
    }

    if (!isLogin) {
      if (!formData.email.trim()) {
        newErrors.email = 'EMAIL_REQUIRED';
      } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
        newErrors.email = 'INVALID_EMAIL_FORMAT';
      }
    }

    if (!formData.password) {
      newErrors.password = 'PASSWORD_REQUIRED';
    } else if (formData.password.length < 6) {
      newErrors.password = 'PASSWORD_TOO_SHORT';
    }

    if (!isLogin && formData.password !== formData.confirmPassword) {
      newErrors.confirmPassword = 'PASSWORDS_DO_NOT_MATCH';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!validateForm()) return;

    // Get existing users from localStorage
    const users = JSON.parse(localStorage.getItem('acidwave_users') || '[]');

    if (isLogin) {
      // Login logic
      const user = users.find(u => u.username === formData.username && u.password === formData.password);
      if (user) {
        onLogin({
          username: user.username,
          email: user.email,
          avatar: user.avatar
        });
      } else {
        setErrors({ password: 'INVALID_CREDENTIALS' });
      }
    } else {
      // Register logic
      const userExists = users.find(u => u.username === formData.username);
      if (userExists) {
        setErrors({ username: 'USERNAME_ALREADY_EXISTS' });
        return;
      }

      const emailExists = users.find(u => u.email === formData.email);
      if (emailExists) {
        setErrors({ email: 'EMAIL_ALREADY_REGISTERED' });
        return;
      }

      // Create new user
      const newUser = {
        username: formData.username,
        email: formData.email,
        password: formData.password,
        avatar: `https://api.dicebear.com/7.x/pixel-art/svg?seed=${formData.username}`,
        createdAt: new Date().toISOString()
      };

      users.push(newUser);
      localStorage.setItem('acidwave_users', JSON.stringify(users));

      // Auto login after registration
      onLogin({
        username: newUser.username,
        email: newUser.email,
        avatar: newUser.avatar
      });
    }
  };

  const switchMode = () => {
    setIsLogin(!isLogin);
    setErrors({});
    setFormData({
      username: '',
      email: '',
      password: '',
      confirmPassword: ''
    });
  };

  return (
    <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/90 backdrop-blur-md animate-in fade-in duration-300">
      {/* Animated Background */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-[#CCFF00] opacity-10 blur-[120px] rounded-full animate-pulse"></div>
        <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-[#FF00FF] opacity-10 blur-[120px] rounded-full animate-pulse" style={{ animationDelay: '1s' }}></div>
      </div>

      {/* Close Button */}
      {onClose && (
        <button
          onClick={onClose}
          className="absolute top-8 right-8 p-2 border border-[#333] hover:border-[#CCFF00] hover:text-[#CCFF00] text-gray-500 transition-colors z-10"
        >
          <X size={24} />
        </button>
      )}

      <div className="relative w-full max-w-md mx-4">
        {/* Glowing Border Effect */}
        <div className="absolute -inset-1 bg-gradient-to-r from-[#CCFF00] to-[#FF00FF] opacity-20 blur-xl"></div>

        {/* Main Container */}
        <div className="relative bg-black border-2 border-[#333] p-8">
          {/* Header */}
          <div className="text-center mb-8">
            <h1 className="text-4xl font-black italic tracking-tighter text-white mb-2" style={{ textShadow: '2px 2px 0px #CCFF00' }}>
              ACID<span className="text-transparent bg-clip-text bg-gradient-to-b from-gray-100 to-gray-500">WAVE</span>
            </h1>
            <p className="text-xs font-mono text-gray-500 tracking-widest">
              {isLogin ? '[ ACCESS_PORTAL ]' : '[ REGISTRATION_PROTOCOL ]'}
            </p>
          </div>

          {/* Tab Switcher */}
          <div className="flex gap-2 mb-6 bg-[#0a0a0a] p-1 border border-[#333]">
            <button
              onClick={() => setIsLogin(true)}
              className={`flex-1 flex items-center justify-center gap-2 py-2 text-xs font-bold font-mono transition-all uppercase tracking-widest ${
                isLogin ? 'bg-[#CCFF00] text-black shadow-[0_0_10px_#CCFF00]' : 'text-gray-500 hover:text-white'
              }`}
            >
              <LogIn size={14} /> LOGIN
            </button>
            <button
              onClick={() => setIsLogin(false)}
              className={`flex-1 flex items-center justify-center gap-2 py-2 text-xs font-bold font-mono transition-all uppercase tracking-widest ${
                !isLogin ? 'bg-[#CCFF00] text-black shadow-[0_0_10px_#CCFF00]' : 'text-gray-500 hover:text-white'
              }`}
            >
              <UserPlus size={14} /> REGISTER
            </button>
          </div>

          {/* Form */}
          <form onSubmit={handleSubmit} className="space-y-4">
            {/* Username Field */}
            <div>
              <label className="block text-[10px] font-bold text-gray-500 tracking-[0.2em] mb-2">
                USERNAME_ID
              </label>
              <div className="relative">
                <User size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-600" />
                <input
                  type="text"
                  name="username"
                  value={formData.username}
                  onChange={handleChange}
                  placeholder="ENTER_USERNAME..."
                  className={`w-full bg-black border ${errors.username ? 'border-red-500' : 'border-[#333]'} text-[#CCFF00] pl-10 pr-4 py-3 text-sm font-mono focus:outline-none focus:border-[#CCFF00] placeholder:text-gray-700 transition-colors`}
                />
              </div>
              {errors.username && (
                <p className="text-red-500 text-[10px] font-mono mt-1 tracking-wider">! {errors.username}</p>
              )}
            </div>

            {/* Email Field (Register Only) */}
            {!isLogin && (
              <div>
                <label className="block text-[10px] font-bold text-gray-500 tracking-[0.2em] mb-2">
                  EMAIL_ADDRESS
                </label>
                <div className="relative">
                  <Mail size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-600" />
                  <input
                    type="email"
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                    placeholder="ENTER_EMAIL..."
                    className={`w-full bg-black border ${errors.email ? 'border-red-500' : 'border-[#333]'} text-[#CCFF00] pl-10 pr-4 py-3 text-sm font-mono focus:outline-none focus:border-[#CCFF00] placeholder:text-gray-700 transition-colors`}
                  />
                </div>
                {errors.email && (
                  <p className="text-red-500 text-[10px] font-mono mt-1 tracking-wider">! {errors.email}</p>
                )}
              </div>
            )}

            {/* Password Field */}
            <div>
              <label className="block text-[10px] font-bold text-gray-500 tracking-[0.2em] mb-2">
                PASSWORD_KEY
              </label>
              <div className="relative">
                <Lock size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-600" />
                <input
                  type="password"
                  name="password"
                  value={formData.password}
                  onChange={handleChange}
                  placeholder="ENTER_PASSWORD..."
                  className={`w-full bg-black border ${errors.password ? 'border-red-500' : 'border-[#333]'} text-[#CCFF00] pl-10 pr-4 py-3 text-sm font-mono focus:outline-none focus:border-[#CCFF00] placeholder:text-gray-700 transition-colors`}
                />
              </div>
              {errors.password && (
                <p className="text-red-500 text-[10px] font-mono mt-1 tracking-wider">! {errors.password}</p>
              )}
            </div>

            {/* Confirm Password Field (Register Only) */}
            {!isLogin && (
              <div>
                <label className="block text-[10px] font-bold text-gray-500 tracking-[0.2em] mb-2">
                  CONFIRM_PASSWORD
                </label>
                <div className="relative">
                  <Lock size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-600" />
                  <input
                    type="password"
                    name="confirmPassword"
                    value={formData.confirmPassword}
                    onChange={handleChange}
                    placeholder="CONFIRM_PASSWORD..."
                    className={`w-full bg-black border ${errors.confirmPassword ? 'border-red-500' : 'border-[#333]'} text-[#CCFF00] pl-10 pr-4 py-3 text-sm font-mono focus:outline-none focus:border-[#CCFF00] placeholder:text-gray-700 transition-colors`}
                  />
                </div>
                {errors.confirmPassword && (
                  <p className="text-red-500 text-[10px] font-mono mt-1 tracking-wider">! {errors.confirmPassword}</p>
                )}
              </div>
            )}

            {/* Submit Button */}
            <div className="pt-4">
              <ChromeButton type="submit" active={true} className="w-full">
                {isLogin ? 'INITIATE_ACCESS' : 'CREATE_ACCOUNT'}
              </ChromeButton>
            </div>
          </form>

          {/* Footer */}
          <div className="mt-6 pt-6 border-t border-[#333] text-center">
            <p className="text-xs font-mono text-gray-600">
              {isLogin ? 'NEW_USER_DETECTED?' : 'ALREADY_REGISTERED?'}
            </p>
            <button
              onClick={switchMode}
              className="mt-2 text-xs font-bold text-[#CCFF00] hover:text-white transition-colors uppercase tracking-widest"
            >
              {isLogin ? '>> CREATE_ACCOUNT' : '>> ACCESS_LOGIN'}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

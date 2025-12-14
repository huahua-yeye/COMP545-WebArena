import { ExternalLink } from 'lucide-react';

/**
 * Footer component with music attribution and license information
 * Required for CC BY 4.0 compliance
 */
export function Footer({ onLicensesClick }) {

  return (
    <footer className="bg-black border-t border-[#333] text-white py-6 mt-auto">
      <div className="container mx-auto px-6">
        {/* Copyright & Links */}
        <div className="flex flex-col sm:flex-row justify-between items-center gap-3">
          <div className="text-[10px] text-gray-600 font-mono tracking-wider">
            © {new Date().getFullYear()} ACIDWAVE. ALL_RIGHTS_RESERVED.
          </div>

          <div className="flex gap-4 text-[10px] font-mono">
            <button
              onClick={onLicensesClick}
              className="text-gray-500 hover:text-[#CCFF00] transition-colors uppercase tracking-widest"
            >
              LICENSES
            </button>
            <button
              onClick={onLicensesClick}
              className="text-gray-500 hover:text-[#CCFF00] transition-colors uppercase tracking-widest"
            >
              ABOUT
            </button>
            <a
              href="https://github.com"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-500 hover:text-[#CCFF00] transition-colors uppercase tracking-widest inline-flex items-center gap-1"
            >
              GITHUB
              <ExternalLink size={8} />
            </a>
          </div>
        </div>

        {/* Acid Wave Branding */}
        <div className="mt-4 text-center">
          <div className="text-[8px] text-gray-700 font-mono tracking-widest">
            ⚡ POWERED_BY_ACID_TECHNOLOGY ⚡
          </div>
        </div>
      </div>
    </footer>
  );
}

export default Footer;

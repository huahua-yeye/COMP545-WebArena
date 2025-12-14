import { ExternalLink } from 'lucide-react';

/**
 * Footer component with music attribution and license information
 * Required for CC BY 4.0 compliance
 */
export function Footer({ onLicensesClick }) {

  return (
    <footer className="bg-black border-t border-[#333] text-white py-6 mt-auto">
      <div className="container mx-auto px-6">
        {/* Copyright */}
        <div className="flex justify-center items-center">
          <div className="text-[10px] text-gray-600 font-mono tracking-wider">
            © {new Date().getFullYear()} ACIDWAVE. ALL_RIGHTS_RESERVED.
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

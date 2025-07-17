import 'package:flutter/material.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class VendorSignupScreen extends StatefulWidget {
  const VendorSignupScreen({super.key});

  @override
  State<VendorSignupScreen> createState() => _VendorSignupScreenState();
}

class _VendorSignupScreenState extends State<VendorSignupScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // First Page Expandable sections state
  bool _businessInfoExpanded = true;
  bool _bankInfoExpanded = false;
  bool _mobileMoneyExpanded = false;

  // Second Page Expandable sections state
  bool _productInfoExpanded = true;
  bool _legalInfoExpanded = false;
  bool _contactInfoExpanded = false;

  // Business Info Controllers
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _tradeNameController = TextEditingController();
  final TextEditingController _businessRegNumberController = TextEditingController();
  final TextEditingController _taxIdController = TextEditingController();
  final TextEditingController _businessAddressController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _yearsInOperationController = TextEditingController();
  
  String? _selectedBusinessType;
  String? _selectedProductType;

  // Bank Info Controllers
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _branchAddressController = TextEditingController();
  final TextEditingController _accountHolderController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  // Mobile Money Controllers
  final TextEditingController _mobileMoneyNumberController = TextEditingController();
  final TextEditingController _mobileMoneyHolderController = TextEditingController();
  String _selectedMobileMoneyProvider = 'EVC Plus';

  // Page 2 Controllers
  String? _selectedProductCategory;
  String _selectedPricingModel = 'Fixed';
  String? _selectedMOQ;
  String? _selectedWarranty;
  String? _selectedLeadTime;
  
  // Contact Info Controllers
  final TextEditingController _primaryContactNameController = TextEditingController();
  final TextEditingController _primaryPhoneController = TextEditingController();
  final TextEditingController _emergencyContactNameController = TextEditingController();
  final TextEditingController _emergencyPhoneController = TextEditingController();
  
  bool _agreesToTerms = false;

  @override
  void dispose() {
    // Business Info
    _shopNameController.dispose();
    _tradeNameController.dispose();
    _businessRegNumberController.dispose();
    _taxIdController.dispose();
    _businessAddressController.dispose();
    _websiteController.dispose();
    _phoneController.dispose();
    _yearsInOperationController.dispose();
    
    // Bank Info
    _bankNameController.dispose();
    _branchNameController.dispose();
    _branchAddressController.dispose();
    _accountHolderController.dispose();
    _accountNumberController.dispose();
    
    // Mobile Money
    _mobileMoneyNumberController.dispose();
    _mobileMoneyHolderController.dispose();
    
    // Page 2 Controllers
    _primaryContactNameController.dispose();
    _primaryPhoneController.dispose();
    _emergencyContactNameController.dispose();
    _emergencyPhoneController.dispose();
    
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Register as Vendor',
          style: GoogleFonts.poppins(
            color: AppTheme.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Step indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SizedBox(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Dotted connector line
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.3,
                    child: CustomPaint(
                      size: const Size(double.infinity, 2),
                      painter: DottedLinePainter(
                        color: AppTheme.primaryColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  // Step circles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStepCircle(1, _currentPage >= 0),
                      const SizedBox(width: 80),
                      _buildStepCircle(2, _currentPage >= 1),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Page content
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildBusinessDetailsPage(),
                _buildProductAndLegalPage(),
              ],
            ),
          ),
          
          // Navigation buttons
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                if (_currentPage > 0) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppTheme.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(0, 56),
                      ),
                      child: Text(
                        'Previous',
                        style: GoogleFonts.poppins(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  flex: _currentPage > 0 ? 1 : 2,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Submit form
                        _submitVendorRegistration();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(0, 56),
                    ),
                    child: Text(
                      _currentPage < 1 ? 'Next' : 'Submit',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessDetailsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Business Info Section
          _buildExpandableSection(
            'Business Information',
            _businessInfoExpanded,
            () => setState(() => _businessInfoExpanded = !_businessInfoExpanded),
            _buildBusinessInfoFields(),
          ),
          const SizedBox(height: 20),
          
          // Bank Info Section
          _buildExpandableSection(
            'Bank Details',
            _bankInfoExpanded,
            () => setState(() => _bankInfoExpanded = !_bankInfoExpanded),
            _buildBankInfoFields(),
          ),
          const SizedBox(height: 20),
          
          // Mobile Money Section
          _buildExpandableSection(
            'Mobile Money Details',
            _mobileMoneyExpanded,
            () => setState(() => _mobileMoneyExpanded = !_mobileMoneyExpanded),
            _buildMobileMoneyFields(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductAndLegalPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Information Section
          _buildExpandableSection(
            'Product Information',
            _productInfoExpanded,
            () => setState(() => _productInfoExpanded = !_productInfoExpanded),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdownField('Product Category', _selectedProductCategory, 
                  ['Electronics', 'Fashion & Apparel', 'Food & Beverages', 'Home & Garden', 'Sports & Outdoors', 'Books & Media', 'Health & Beauty', 'Automotive'], 
                  (value) => setState(() => _selectedProductCategory = value),
                  'Select Category'
                ),
                const SizedBox(height: 16),
                
                _buildPricingModelSection(),
                const SizedBox(height: 16),
                
                _buildDropdownField('MOQ', _selectedMOQ, 
                  ['1-10 pieces', '11-50 pieces', '51-100 pieces', '101-500 pieces', '500+ pieces'], 
                  (value) => setState(() => _selectedMOQ = value),
                  'Select MOQ'
                ),
                const SizedBox(height: 16),
                
                _buildDropdownField('Warranty', _selectedWarranty, 
                  ['No Warranty', '3 Months', '6 Months', '1 Year', '2 Years', '3+ Years'], 
                  (value) => setState(() => _selectedWarranty = value),
                  'Select Warranty'
                ),
                const SizedBox(height: 16),
                
                _buildDropdownField('Lead Time', _selectedLeadTime, 
                  ['Same Day', '1-2 Days', '3-7 Days', '1-2 Weeks', '2-4 Weeks', '1+ Months'], 
                  (value) => setState(() => _selectedLeadTime = value),
                  'Select Lead Time'
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Legal & Compliance Section
          _buildExpandableSection(
            'Legal & Compliance',
            _legalInfoExpanded,
            () => setState(() => _legalInfoExpanded = !_legalInfoExpanded),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUploadField('ID Verification', 'Upload NID or Passport', Icons.camera_alt),
                const SizedBox(height: 16),
                _buildUploadField('Business/Trade License', 'Upload License Documents', Icons.description),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Contact Information Section
          _buildExpandableSection(
            'Contact Information',
            _contactInfoExpanded,
            () => setState(() => _contactInfoExpanded = !_contactInfoExpanded),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField('Primary Contact Name', _primaryContactNameController, 'Contact name'),
                const SizedBox(height: 16),
                _buildTextField('Primary Phone Number', _primaryPhoneController, 'Phone number', keyboardType: TextInputType.phone),
                const SizedBox(height: 16),
                _buildTextField('Emergency Contact Name', _emergencyContactNameController, 'Emergency name'),
                const SizedBox(height: 16),
                _buildTextField('Emergency Contact Number', _emergencyPhoneController, 'Emergency number', keyboardType: TextInputType.phone),
                const SizedBox(height: 24),
                // Terms Agreement
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _agreesToTerms,
                      onChanged: (value) => setState(() => _agreesToTerms = value ?? false),
                      activeColor: AppTheme.primaryColor,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _agreesToTerms = !_agreesToTerms),
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppTheme.textColor,
                            ),
                            children: [
                              const TextSpan(text: 'I agree to your '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: GoogleFonts.poppins(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: GoogleFonts.poppins(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String hint, {bool hasIcon = false, IconData? icon, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: AppTheme.darkGrayColor),
            suffixIcon: hasIcon && icon != null ? Icon(icon, color: AppTheme.darkGrayColor) : null,
            filled: true,
            fillColor: AppTheme.lightGrayColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String? value, List<String> options, Function(String?) onChanged, [String? customHint]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          isExpanded: true,
          decoration: InputDecoration(
            hintText: customHint ?? 'Select $label',
            hintStyle: GoogleFonts.poppins(
              color: AppTheme.darkGrayColor,
              fontSize: 14,
            ),
            filled: true,
            fillColor: AppTheme.lightGrayColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
            ),
          ),
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: GoogleFonts.poppins(
                  color: AppTheme.textColor,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRadioOption(String title, String value, {String? groupValue, Function(String?)? onChanged}) {
    final currentGroupValue = groupValue ?? _selectedMobileMoneyProvider;
    final currentOnChanged = onChanged ?? (String? value) {
      setState(() {
        _selectedMobileMoneyProvider = value!;
      });
    };
    
    return RadioListTile<String>(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: AppTheme.textColor,
        ),
      ),
      value: value,
      groupValue: currentGroupValue,
      onChanged: currentOnChanged,
      activeColor: AppTheme.primaryColor,
      contentPadding: EdgeInsets.zero,
    );
  }

  void _submitVendorRegistration() {
    // TODO: Implement vendor registration logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Vendor registration submitted successfully!',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
    Navigator.pop(context);
  }

  Widget _buildStepCircle(int step, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppTheme.primaryColor : Colors.white,
        border: Border.all(
          color: isActive ? AppTheme.primaryColor : AppTheme.primaryColor.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          step.toString(),
          style: GoogleFonts.poppins(
            color: isActive ? Colors.white : AppTheme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableSection(String title, bool isExpanded, VoidCallback onTap, Widget content) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.lightGrayColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppTheme.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            const Divider(height: 1, color: AppTheme.lightGrayColor),
            Padding(
              padding: const EdgeInsets.all(16),
              child: content,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBusinessInfoFields() {
    return Column(
      children: [
        _buildTextField('Shop Name', _shopNameController, 'Shop name'),
        const SizedBox(height: 16),
        _buildTextField('Trade Name', _tradeNameController, 'Trade name'),
        const SizedBox(height: 16),
        _buildTextField('Business Registration Number', _businessRegNumberController, 'Reg number'),
        const SizedBox(height: 16),
        _buildDropdownField('Type of Business', _selectedBusinessType, ['Retail', 'Wholesale', 'Manufacturing', 'Service'], (value) {
          setState(() => _selectedBusinessType = value);
        }, 'Select type'),
        const SizedBox(height: 16),
        _buildDropdownField('Product Type', _selectedProductType, ['Electronics', 'Fashion', 'Food & Beverages', 'Home & Garden', 'Sports', 'Books'], (value) {
          setState(() => _selectedProductType = value);
        }, 'Select type'),
        const SizedBox(height: 16),
        _buildTextField('Tax Identity Number', _taxIdController, 'Tax ID'),
        const SizedBox(height: 16),
        _buildTextField('Shop/Business Address', _businessAddressController, 'Address', hasIcon: true, icon: Icons.location_pin),
        const SizedBox(height: 16),
        _buildTextField('Website', _websiteController, 'Website URL'),
        const SizedBox(height: 16),
        _buildTextField('Phone Number', _phoneController, 'Phone', keyboardType: TextInputType.phone),
        const SizedBox(height: 16),
        _buildTextField('Years in Operation', _yearsInOperationController, 'Years', keyboardType: TextInputType.number),
      ],
    );
  }

  Widget _buildBankInfoFields() {
    return Column(
      children: [
        _buildTextField('Bank Name', _bankNameController, 'Bank name'),
        const SizedBox(height: 16),
        _buildTextField('Branch Name', _branchNameController, 'Branch name'),
        const SizedBox(height: 16),
        _buildTextField('Branch Address', _branchAddressController, 'Branch address', hasIcon: true, icon: Icons.location_pin),
        const SizedBox(height: 16),
        _buildTextField('Bank Account Holder Name', _accountHolderController, 'Account holder'),
        const SizedBox(height: 16),
        _buildTextField('Bank Account Number', _accountNumberController, 'Account number', keyboardType: TextInputType.number),
      ],
    );
  }

  Widget _buildMobileMoneyFields() {
    return Column(
      children: [
        Text(
          'Select Mobile Money Provider',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 16),
        _buildRadioOption('EVC Plus Number (Hormuud)', 'EVC Plus'),
        _buildRadioOption('Sahal (NationLink)', 'Sahal'),
        _buildRadioOption('Telesom ZAAD', 'ZAAD'),
        const SizedBox(height: 16),
        _buildTextField('Mobile Money Number', _mobileMoneyNumberController, 'Mobile number', keyboardType: TextInputType.phone),
        const SizedBox(height: 16),
        _buildTextField('Account Holder Name', _mobileMoneyHolderController, 'Account holder'),
      ],
    );
  }

  Widget _buildPricingModelSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pricing Model',
          style: GoogleFonts.poppins(
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            RadioListTile<String>(
              title: Text(
                'Fixed',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppTheme.textColor,
                ),
              ),
              value: 'Fixed',
              groupValue: _selectedPricingModel,
              onChanged: (value) => setState(() => _selectedPricingModel = value!),
              activeColor: AppTheme.primaryColor,
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile<String>(
              title: Text(
                'Negotiable',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppTheme.textColor,
                ),
              ),
              value: 'Negotiable',
              groupValue: _selectedPricingModel,
              onChanged: (value) => setState(() => _selectedPricingModel = value!),
              activeColor: AppTheme.primaryColor,
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile<String>(
              title: Text(
                'Bulk',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppTheme.textColor,
                ),
              ),
              value: 'Bulk',
              groupValue: _selectedPricingModel,
              onChanged: (value) => setState(() => _selectedPricingModel = value!),
              activeColor: AppTheme.primaryColor,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadField(String label, String hint, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.lightGrayColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(icon, color: AppTheme.darkGrayColor),
              const SizedBox(width: 12),
              Text(
                hint == 'Upload NID or Passport' ? 'Upload NID' : 'Upload License',
                style: GoogleFonts.poppins(
                  color: AppTheme.darkGrayColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  
  DottedLinePainter({required this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
      
    const double dashWidth = 5;
    const double dashSpace = 5;
    double currentX = 0;
    
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, size.height / 2),
        Offset(currentX + dashWidth, size.height / 2),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

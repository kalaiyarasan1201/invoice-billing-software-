// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CompaniesTable extends Companies
    with TableInfo<$CompaniesTable, Company> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompaniesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _legalNameMeta = const VerificationMeta(
    'legalName',
  );
  @override
  late final GeneratedColumn<String> legalName = GeneratedColumn<String>(
    'legal_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gstinMeta = const VerificationMeta('gstin');
  @override
  late final GeneratedColumn<String> gstin = GeneratedColumn<String>(
    'gstin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _panMeta = const VerificationMeta('pan');
  @override
  late final GeneratedColumn<String> pan = GeneratedColumn<String>(
    'pan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cinMeta = const VerificationMeta('cin');
  @override
  late final GeneratedColumn<String> cin = GeneratedColumn<String>(
    'cin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registeredAddressMeta = const VerificationMeta(
    'registeredAddress',
  );
  @override
  late final GeneratedColumn<String> registeredAddress =
      GeneratedColumn<String>(
        'registered_address',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _corporateAddressMeta = const VerificationMeta(
    'corporateAddress',
  );
  @override
  late final GeneratedColumn<String> corporateAddress = GeneratedColumn<String>(
    'corporate_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateCodeMeta = const VerificationMeta(
    'stateCode',
  );
  @override
  late final GeneratedColumn<String> stateCode = GeneratedColumn<String>(
    'state_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountNumberMeta = const VerificationMeta(
    'accountNumber',
  );
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
    'account_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ifscMeta = const VerificationMeta('ifsc');
  @override
  late final GeneratedColumn<String> ifsc = GeneratedColumn<String>(
    'ifsc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _branchMeta = const VerificationMeta('branch');
  @override
  late final GeneratedColumn<String> branch = GeneratedColumn<String>(
    'branch',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyName,
    legalName,
    gstin,
    pan,
    cin,
    phone,
    email,
    registeredAddress,
    corporateAddress,
    state,
    stateCode,
    bankName,
    accountNumber,
    ifsc,
    branch,
    logoPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'companies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Company> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('legal_name')) {
      context.handle(
        _legalNameMeta,
        legalName.isAcceptableOrUnknown(data['legal_name']!, _legalNameMeta),
      );
    }
    if (data.containsKey('gstin')) {
      context.handle(
        _gstinMeta,
        gstin.isAcceptableOrUnknown(data['gstin']!, _gstinMeta),
      );
    }
    if (data.containsKey('pan')) {
      context.handle(
        _panMeta,
        pan.isAcceptableOrUnknown(data['pan']!, _panMeta),
      );
    }
    if (data.containsKey('cin')) {
      context.handle(
        _cinMeta,
        cin.isAcceptableOrUnknown(data['cin']!, _cinMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('registered_address')) {
      context.handle(
        _registeredAddressMeta,
        registeredAddress.isAcceptableOrUnknown(
          data['registered_address']!,
          _registeredAddressMeta,
        ),
      );
    }
    if (data.containsKey('corporate_address')) {
      context.handle(
        _corporateAddressMeta,
        corporateAddress.isAcceptableOrUnknown(
          data['corporate_address']!,
          _corporateAddressMeta,
        ),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('state_code')) {
      context.handle(
        _stateCodeMeta,
        stateCode.isAcceptableOrUnknown(data['state_code']!, _stateCodeMeta),
      );
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('account_number')) {
      context.handle(
        _accountNumberMeta,
        accountNumber.isAcceptableOrUnknown(
          data['account_number']!,
          _accountNumberMeta,
        ),
      );
    }
    if (data.containsKey('ifsc')) {
      context.handle(
        _ifscMeta,
        ifsc.isAcceptableOrUnknown(data['ifsc']!, _ifscMeta),
      );
    }
    if (data.containsKey('branch')) {
      context.handle(
        _branchMeta,
        branch.isAcceptableOrUnknown(data['branch']!, _branchMeta),
      );
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Company map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Company(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      )!,
      legalName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}legal_name'],
      ),
      gstin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gstin'],
      ),
      pan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pan'],
      ),
      cin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cin'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      registeredAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registered_address'],
      ),
      corporateAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corporate_address'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      stateCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_code'],
      ),
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      accountNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_number'],
      ),
      ifsc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ifsc'],
      ),
      branch: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}branch'],
      ),
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
    );
  }

  @override
  $CompaniesTable createAlias(String alias) {
    return $CompaniesTable(attachedDatabase, alias);
  }
}

class Company extends DataClass implements Insertable<Company> {
  final int id;
  final String companyName;
  final String? legalName;
  final String? gstin;
  final String? pan;
  final String? cin;
  final String? phone;
  final String? email;
  final String? registeredAddress;
  final String? corporateAddress;
  final String? state;
  final String? stateCode;
  final String? bankName;
  final String? accountNumber;
  final String? ifsc;
  final String? branch;
  final String? logoPath;
  const Company({
    required this.id,
    required this.companyName,
    this.legalName,
    this.gstin,
    this.pan,
    this.cin,
    this.phone,
    this.email,
    this.registeredAddress,
    this.corporateAddress,
    this.state,
    this.stateCode,
    this.bankName,
    this.accountNumber,
    this.ifsc,
    this.branch,
    this.logoPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_name'] = Variable<String>(companyName);
    if (!nullToAbsent || legalName != null) {
      map['legal_name'] = Variable<String>(legalName);
    }
    if (!nullToAbsent || gstin != null) {
      map['gstin'] = Variable<String>(gstin);
    }
    if (!nullToAbsent || pan != null) {
      map['pan'] = Variable<String>(pan);
    }
    if (!nullToAbsent || cin != null) {
      map['cin'] = Variable<String>(cin);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || registeredAddress != null) {
      map['registered_address'] = Variable<String>(registeredAddress);
    }
    if (!nullToAbsent || corporateAddress != null) {
      map['corporate_address'] = Variable<String>(corporateAddress);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || stateCode != null) {
      map['state_code'] = Variable<String>(stateCode);
    }
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || accountNumber != null) {
      map['account_number'] = Variable<String>(accountNumber);
    }
    if (!nullToAbsent || ifsc != null) {
      map['ifsc'] = Variable<String>(ifsc);
    }
    if (!nullToAbsent || branch != null) {
      map['branch'] = Variable<String>(branch);
    }
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    return map;
  }

  CompaniesCompanion toCompanion(bool nullToAbsent) {
    return CompaniesCompanion(
      id: Value(id),
      companyName: Value(companyName),
      legalName: legalName == null && nullToAbsent
          ? const Value.absent()
          : Value(legalName),
      gstin: gstin == null && nullToAbsent
          ? const Value.absent()
          : Value(gstin),
      pan: pan == null && nullToAbsent ? const Value.absent() : Value(pan),
      cin: cin == null && nullToAbsent ? const Value.absent() : Value(cin),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      registeredAddress: registeredAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(registeredAddress),
      corporateAddress: corporateAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(corporateAddress),
      state: state == null && nullToAbsent
          ? const Value.absent()
          : Value(state),
      stateCode: stateCode == null && nullToAbsent
          ? const Value.absent()
          : Value(stateCode),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      accountNumber: accountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(accountNumber),
      ifsc: ifsc == null && nullToAbsent ? const Value.absent() : Value(ifsc),
      branch: branch == null && nullToAbsent
          ? const Value.absent()
          : Value(branch),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
    );
  }

  factory Company.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Company(
      id: serializer.fromJson<int>(json['id']),
      companyName: serializer.fromJson<String>(json['companyName']),
      legalName: serializer.fromJson<String?>(json['legalName']),
      gstin: serializer.fromJson<String?>(json['gstin']),
      pan: serializer.fromJson<String?>(json['pan']),
      cin: serializer.fromJson<String?>(json['cin']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      registeredAddress: serializer.fromJson<String?>(
        json['registeredAddress'],
      ),
      corporateAddress: serializer.fromJson<String?>(json['corporateAddress']),
      state: serializer.fromJson<String?>(json['state']),
      stateCode: serializer.fromJson<String?>(json['stateCode']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      accountNumber: serializer.fromJson<String?>(json['accountNumber']),
      ifsc: serializer.fromJson<String?>(json['ifsc']),
      branch: serializer.fromJson<String?>(json['branch']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyName': serializer.toJson<String>(companyName),
      'legalName': serializer.toJson<String?>(legalName),
      'gstin': serializer.toJson<String?>(gstin),
      'pan': serializer.toJson<String?>(pan),
      'cin': serializer.toJson<String?>(cin),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'registeredAddress': serializer.toJson<String?>(registeredAddress),
      'corporateAddress': serializer.toJson<String?>(corporateAddress),
      'state': serializer.toJson<String?>(state),
      'stateCode': serializer.toJson<String?>(stateCode),
      'bankName': serializer.toJson<String?>(bankName),
      'accountNumber': serializer.toJson<String?>(accountNumber),
      'ifsc': serializer.toJson<String?>(ifsc),
      'branch': serializer.toJson<String?>(branch),
      'logoPath': serializer.toJson<String?>(logoPath),
    };
  }

  Company copyWith({
    int? id,
    String? companyName,
    Value<String?> legalName = const Value.absent(),
    Value<String?> gstin = const Value.absent(),
    Value<String?> pan = const Value.absent(),
    Value<String?> cin = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> registeredAddress = const Value.absent(),
    Value<String?> corporateAddress = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> stateCode = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    Value<String?> accountNumber = const Value.absent(),
    Value<String?> ifsc = const Value.absent(),
    Value<String?> branch = const Value.absent(),
    Value<String?> logoPath = const Value.absent(),
  }) => Company(
    id: id ?? this.id,
    companyName: companyName ?? this.companyName,
    legalName: legalName.present ? legalName.value : this.legalName,
    gstin: gstin.present ? gstin.value : this.gstin,
    pan: pan.present ? pan.value : this.pan,
    cin: cin.present ? cin.value : this.cin,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    registeredAddress: registeredAddress.present
        ? registeredAddress.value
        : this.registeredAddress,
    corporateAddress: corporateAddress.present
        ? corporateAddress.value
        : this.corporateAddress,
    state: state.present ? state.value : this.state,
    stateCode: stateCode.present ? stateCode.value : this.stateCode,
    bankName: bankName.present ? bankName.value : this.bankName,
    accountNumber: accountNumber.present
        ? accountNumber.value
        : this.accountNumber,
    ifsc: ifsc.present ? ifsc.value : this.ifsc,
    branch: branch.present ? branch.value : this.branch,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
  );
  Company copyWithCompanion(CompaniesCompanion data) {
    return Company(
      id: data.id.present ? data.id.value : this.id,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      legalName: data.legalName.present ? data.legalName.value : this.legalName,
      gstin: data.gstin.present ? data.gstin.value : this.gstin,
      pan: data.pan.present ? data.pan.value : this.pan,
      cin: data.cin.present ? data.cin.value : this.cin,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      registeredAddress: data.registeredAddress.present
          ? data.registeredAddress.value
          : this.registeredAddress,
      corporateAddress: data.corporateAddress.present
          ? data.corporateAddress.value
          : this.corporateAddress,
      state: data.state.present ? data.state.value : this.state,
      stateCode: data.stateCode.present ? data.stateCode.value : this.stateCode,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      accountNumber: data.accountNumber.present
          ? data.accountNumber.value
          : this.accountNumber,
      ifsc: data.ifsc.present ? data.ifsc.value : this.ifsc,
      branch: data.branch.present ? data.branch.value : this.branch,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Company(')
          ..write('id: $id, ')
          ..write('companyName: $companyName, ')
          ..write('legalName: $legalName, ')
          ..write('gstin: $gstin, ')
          ..write('pan: $pan, ')
          ..write('cin: $cin, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('registeredAddress: $registeredAddress, ')
          ..write('corporateAddress: $corporateAddress, ')
          ..write('state: $state, ')
          ..write('stateCode: $stateCode, ')
          ..write('bankName: $bankName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('ifsc: $ifsc, ')
          ..write('branch: $branch, ')
          ..write('logoPath: $logoPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    companyName,
    legalName,
    gstin,
    pan,
    cin,
    phone,
    email,
    registeredAddress,
    corporateAddress,
    state,
    stateCode,
    bankName,
    accountNumber,
    ifsc,
    branch,
    logoPath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Company &&
          other.id == this.id &&
          other.companyName == this.companyName &&
          other.legalName == this.legalName &&
          other.gstin == this.gstin &&
          other.pan == this.pan &&
          other.cin == this.cin &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.registeredAddress == this.registeredAddress &&
          other.corporateAddress == this.corporateAddress &&
          other.state == this.state &&
          other.stateCode == this.stateCode &&
          other.bankName == this.bankName &&
          other.accountNumber == this.accountNumber &&
          other.ifsc == this.ifsc &&
          other.branch == this.branch &&
          other.logoPath == this.logoPath);
}

class CompaniesCompanion extends UpdateCompanion<Company> {
  final Value<int> id;
  final Value<String> companyName;
  final Value<String?> legalName;
  final Value<String?> gstin;
  final Value<String?> pan;
  final Value<String?> cin;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> registeredAddress;
  final Value<String?> corporateAddress;
  final Value<String?> state;
  final Value<String?> stateCode;
  final Value<String?> bankName;
  final Value<String?> accountNumber;
  final Value<String?> ifsc;
  final Value<String?> branch;
  final Value<String?> logoPath;
  const CompaniesCompanion({
    this.id = const Value.absent(),
    this.companyName = const Value.absent(),
    this.legalName = const Value.absent(),
    this.gstin = const Value.absent(),
    this.pan = const Value.absent(),
    this.cin = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.registeredAddress = const Value.absent(),
    this.corporateAddress = const Value.absent(),
    this.state = const Value.absent(),
    this.stateCode = const Value.absent(),
    this.bankName = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.ifsc = const Value.absent(),
    this.branch = const Value.absent(),
    this.logoPath = const Value.absent(),
  });
  CompaniesCompanion.insert({
    this.id = const Value.absent(),
    required String companyName,
    this.legalName = const Value.absent(),
    this.gstin = const Value.absent(),
    this.pan = const Value.absent(),
    this.cin = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.registeredAddress = const Value.absent(),
    this.corporateAddress = const Value.absent(),
    this.state = const Value.absent(),
    this.stateCode = const Value.absent(),
    this.bankName = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.ifsc = const Value.absent(),
    this.branch = const Value.absent(),
    this.logoPath = const Value.absent(),
  }) : companyName = Value(companyName);
  static Insertable<Company> custom({
    Expression<int>? id,
    Expression<String>? companyName,
    Expression<String>? legalName,
    Expression<String>? gstin,
    Expression<String>? pan,
    Expression<String>? cin,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? registeredAddress,
    Expression<String>? corporateAddress,
    Expression<String>? state,
    Expression<String>? stateCode,
    Expression<String>? bankName,
    Expression<String>? accountNumber,
    Expression<String>? ifsc,
    Expression<String>? branch,
    Expression<String>? logoPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyName != null) 'company_name': companyName,
      if (legalName != null) 'legal_name': legalName,
      if (gstin != null) 'gstin': gstin,
      if (pan != null) 'pan': pan,
      if (cin != null) 'cin': cin,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (registeredAddress != null) 'registered_address': registeredAddress,
      if (corporateAddress != null) 'corporate_address': corporateAddress,
      if (state != null) 'state': state,
      if (stateCode != null) 'state_code': stateCode,
      if (bankName != null) 'bank_name': bankName,
      if (accountNumber != null) 'account_number': accountNumber,
      if (ifsc != null) 'ifsc': ifsc,
      if (branch != null) 'branch': branch,
      if (logoPath != null) 'logo_path': logoPath,
    });
  }

  CompaniesCompanion copyWith({
    Value<int>? id,
    Value<String>? companyName,
    Value<String?>? legalName,
    Value<String?>? gstin,
    Value<String?>? pan,
    Value<String?>? cin,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? registeredAddress,
    Value<String?>? corporateAddress,
    Value<String?>? state,
    Value<String?>? stateCode,
    Value<String?>? bankName,
    Value<String?>? accountNumber,
    Value<String?>? ifsc,
    Value<String?>? branch,
    Value<String?>? logoPath,
  }) {
    return CompaniesCompanion(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      legalName: legalName ?? this.legalName,
      gstin: gstin ?? this.gstin,
      pan: pan ?? this.pan,
      cin: cin ?? this.cin,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      registeredAddress: registeredAddress ?? this.registeredAddress,
      corporateAddress: corporateAddress ?? this.corporateAddress,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      ifsc: ifsc ?? this.ifsc,
      branch: branch ?? this.branch,
      logoPath: logoPath ?? this.logoPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (legalName.present) {
      map['legal_name'] = Variable<String>(legalName.value);
    }
    if (gstin.present) {
      map['gstin'] = Variable<String>(gstin.value);
    }
    if (pan.present) {
      map['pan'] = Variable<String>(pan.value);
    }
    if (cin.present) {
      map['cin'] = Variable<String>(cin.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (registeredAddress.present) {
      map['registered_address'] = Variable<String>(registeredAddress.value);
    }
    if (corporateAddress.present) {
      map['corporate_address'] = Variable<String>(corporateAddress.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (stateCode.present) {
      map['state_code'] = Variable<String>(stateCode.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (ifsc.present) {
      map['ifsc'] = Variable<String>(ifsc.value);
    }
    if (branch.present) {
      map['branch'] = Variable<String>(branch.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompaniesCompanion(')
          ..write('id: $id, ')
          ..write('companyName: $companyName, ')
          ..write('legalName: $legalName, ')
          ..write('gstin: $gstin, ')
          ..write('pan: $pan, ')
          ..write('cin: $cin, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('registeredAddress: $registeredAddress, ')
          ..write('corporateAddress: $corporateAddress, ')
          ..write('state: $state, ')
          ..write('stateCode: $stateCode, ')
          ..write('bankName: $bankName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('ifsc: $ifsc, ')
          ..write('branch: $branch, ')
          ..write('logoPath: $logoPath')
          ..write(')'))
        .toString();
  }
}

class $FinancialYearsTable extends FinancialYears
    with TableInfo<$FinancialYearsTable, FinancialYear> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FinancialYearsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isLockedMeta = const VerificationMeta(
    'isLocked',
  );
  @override
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
    'is_locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_locked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    startDate,
    endDate,
    isActive,
    isLocked,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'financial_years';
  @override
  VerificationContext validateIntegrity(
    Insertable<FinancialYear> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_locked')) {
      context.handle(
        _isLockedMeta,
        isLocked.isAcceptableOrUnknown(data['is_locked']!, _isLockedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinancialYear map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinancialYear(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isLocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_locked'],
      )!,
    );
  }

  @override
  $FinancialYearsTable createAlias(String alias) {
    return $FinancialYearsTable(attachedDatabase, alias);
  }
}

class FinancialYear extends DataClass implements Insertable<FinancialYear> {
  final int id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isLocked;
  const FinancialYear({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.isLocked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['is_active'] = Variable<bool>(isActive);
    map['is_locked'] = Variable<bool>(isLocked);
    return map;
  }

  FinancialYearsCompanion toCompanion(bool nullToAbsent) {
    return FinancialYearsCompanion(
      id: Value(id),
      name: Value(name),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isActive: Value(isActive),
      isLocked: Value(isLocked),
    );
  }

  factory FinancialYear.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinancialYear(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isLocked: serializer.fromJson<bool>(json['isLocked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'isActive': serializer.toJson<bool>(isActive),
      'isLocked': serializer.toJson<bool>(isLocked),
    };
  }

  FinancialYear copyWith({
    int? id,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
    bool? isLocked,
  }) => FinancialYear(
    id: id ?? this.id,
    name: name ?? this.name,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    isActive: isActive ?? this.isActive,
    isLocked: isLocked ?? this.isLocked,
  );
  FinancialYear copyWithCompanion(FinancialYearsCompanion data) {
    return FinancialYear(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isLocked: data.isLocked.present ? data.isLocked.value : this.isLocked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinancialYear(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('isLocked: $isLocked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, startDate, endDate, isActive, isLocked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinancialYear &&
          other.id == this.id &&
          other.name == this.name &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isActive == this.isActive &&
          other.isLocked == this.isLocked);
}

class FinancialYearsCompanion extends UpdateCompanion<FinancialYear> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isActive;
  final Value<bool> isLocked;
  const FinancialYearsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isLocked = const Value.absent(),
  });
  FinancialYearsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    this.isActive = const Value.absent(),
    this.isLocked = const Value.absent(),
  }) : name = Value(name),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<FinancialYear> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isActive,
    Expression<bool>? isLocked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isActive != null) 'is_active': isActive,
      if (isLocked != null) 'is_locked': isLocked,
    });
  }

  FinancialYearsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<bool>? isActive,
    Value<bool>? isLocked,
  }) {
    return FinancialYearsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      isLocked: isLocked ?? this.isLocked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isLocked.present) {
      map['is_locked'] = Variable<bool>(isLocked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinancialYearsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('isLocked: $isLocked')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _customerCodeMeta = const VerificationMeta(
    'customerCode',
  );
  @override
  late final GeneratedColumn<String> customerCode = GeneratedColumn<String>(
    'customer_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _tradeNameMeta = const VerificationMeta(
    'tradeName',
  );
  @override
  late final GeneratedColumn<String> tradeName = GeneratedColumn<String>(
    'trade_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _legalNameMeta = const VerificationMeta(
    'legalName',
  );
  @override
  late final GeneratedColumn<String> legalName = GeneratedColumn<String>(
    'legal_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gstinMeta = const VerificationMeta('gstin');
  @override
  late final GeneratedColumn<String> gstin = GeneratedColumn<String>(
    'gstin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _panMeta = const VerificationMeta('pan');
  @override
  late final GeneratedColumn<String> pan = GeneratedColumn<String>(
    'pan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactPersonMeta = const VerificationMeta(
    'contactPerson',
  );
  @override
  late final GeneratedColumn<String> contactPerson = GeneratedColumn<String>(
    'contact_person',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _billingAddressMeta = const VerificationMeta(
    'billingAddress',
  );
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
    'billing_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shippingAddressMeta = const VerificationMeta(
    'shippingAddress',
  );
  @override
  late final GeneratedColumn<String> shippingAddress = GeneratedColumn<String>(
    'shipping_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateCodeMeta = const VerificationMeta(
    'stateCode',
  );
  @override
  late final GeneratedColumn<String> stateCode = GeneratedColumn<String>(
    'state_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _openingBalanceTypeMeta =
      const VerificationMeta('openingBalanceType');
  @override
  late final GeneratedColumn<String> openingBalanceType =
      GeneratedColumn<String>(
        'opening_balance_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('Dr'),
      );
  static const VerificationMeta _creditLimitMeta = const VerificationMeta(
    'creditLimit',
  );
  @override
  late final GeneratedColumn<double> creditLimit = GeneratedColumn<double>(
    'credit_limit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _creditDaysMeta = const VerificationMeta(
    'creditDays',
  );
  @override
  late final GeneratedColumn<int> creditDays = GeneratedColumn<int>(
    'credit_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _priceTierMeta = const VerificationMeta(
    'priceTier',
  );
  @override
  late final GeneratedColumn<String> priceTier = GeneratedColumn<String>(
    'price_tier',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerCode,
    tradeName,
    legalName,
    gstin,
    pan,
    phone,
    email,
    contactPerson,
    billingAddress,
    shippingAddress,
    city,
    state,
    stateCode,
    openingBalance,
    openingBalanceType,
    creditLimit,
    creditDays,
    priceTier,
    status,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_code')) {
      context.handle(
        _customerCodeMeta,
        customerCode.isAcceptableOrUnknown(
          data['customer_code']!,
          _customerCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customerCodeMeta);
    }
    if (data.containsKey('trade_name')) {
      context.handle(
        _tradeNameMeta,
        tradeName.isAcceptableOrUnknown(data['trade_name']!, _tradeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tradeNameMeta);
    }
    if (data.containsKey('legal_name')) {
      context.handle(
        _legalNameMeta,
        legalName.isAcceptableOrUnknown(data['legal_name']!, _legalNameMeta),
      );
    }
    if (data.containsKey('gstin')) {
      context.handle(
        _gstinMeta,
        gstin.isAcceptableOrUnknown(data['gstin']!, _gstinMeta),
      );
    }
    if (data.containsKey('pan')) {
      context.handle(
        _panMeta,
        pan.isAcceptableOrUnknown(data['pan']!, _panMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('contact_person')) {
      context.handle(
        _contactPersonMeta,
        contactPerson.isAcceptableOrUnknown(
          data['contact_person']!,
          _contactPersonMeta,
        ),
      );
    }
    if (data.containsKey('billing_address')) {
      context.handle(
        _billingAddressMeta,
        billingAddress.isAcceptableOrUnknown(
          data['billing_address']!,
          _billingAddressMeta,
        ),
      );
    }
    if (data.containsKey('shipping_address')) {
      context.handle(
        _shippingAddressMeta,
        shippingAddress.isAcceptableOrUnknown(
          data['shipping_address']!,
          _shippingAddressMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('state_code')) {
      context.handle(
        _stateCodeMeta,
        stateCode.isAcceptableOrUnknown(data['state_code']!, _stateCodeMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('opening_balance_type')) {
      context.handle(
        _openingBalanceTypeMeta,
        openingBalanceType.isAcceptableOrUnknown(
          data['opening_balance_type']!,
          _openingBalanceTypeMeta,
        ),
      );
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
        _creditLimitMeta,
        creditLimit.isAcceptableOrUnknown(
          data['credit_limit']!,
          _creditLimitMeta,
        ),
      );
    }
    if (data.containsKey('credit_days')) {
      context.handle(
        _creditDaysMeta,
        creditDays.isAcceptableOrUnknown(data['credit_days']!, _creditDaysMeta),
      );
    }
    if (data.containsKey('price_tier')) {
      context.handle(
        _priceTierMeta,
        priceTier.isAcceptableOrUnknown(data['price_tier']!, _priceTierMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      customerCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_code'],
      )!,
      tradeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trade_name'],
      )!,
      legalName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}legal_name'],
      ),
      gstin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gstin'],
      ),
      pan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pan'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      contactPerson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_person'],
      ),
      billingAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}billing_address'],
      ),
      shippingAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipping_address'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      stateCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_code'],
      ),
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}opening_balance'],
      )!,
      openingBalanceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opening_balance_type'],
      )!,
      creditLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}credit_limit'],
      )!,
      creditDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_days'],
      )!,
      priceTier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price_tier'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String customerCode;
  final String tradeName;
  final String? legalName;
  final String? gstin;
  final String? pan;
  final String? phone;
  final String? email;
  final String? contactPerson;
  final String? billingAddress;
  final String? shippingAddress;
  final String? city;
  final String? state;
  final String? stateCode;
  final double openingBalance;
  final String openingBalanceType;
  final double creditLimit;
  final int creditDays;
  final String? priceTier;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Customer({
    required this.id,
    required this.customerCode,
    required this.tradeName,
    this.legalName,
    this.gstin,
    this.pan,
    this.phone,
    this.email,
    this.contactPerson,
    this.billingAddress,
    this.shippingAddress,
    this.city,
    this.state,
    this.stateCode,
    required this.openingBalance,
    required this.openingBalanceType,
    required this.creditLimit,
    required this.creditDays,
    this.priceTier,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_code'] = Variable<String>(customerCode);
    map['trade_name'] = Variable<String>(tradeName);
    if (!nullToAbsent || legalName != null) {
      map['legal_name'] = Variable<String>(legalName);
    }
    if (!nullToAbsent || gstin != null) {
      map['gstin'] = Variable<String>(gstin);
    }
    if (!nullToAbsent || pan != null) {
      map['pan'] = Variable<String>(pan);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || contactPerson != null) {
      map['contact_person'] = Variable<String>(contactPerson);
    }
    if (!nullToAbsent || billingAddress != null) {
      map['billing_address'] = Variable<String>(billingAddress);
    }
    if (!nullToAbsent || shippingAddress != null) {
      map['shipping_address'] = Variable<String>(shippingAddress);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || stateCode != null) {
      map['state_code'] = Variable<String>(stateCode);
    }
    map['opening_balance'] = Variable<double>(openingBalance);
    map['opening_balance_type'] = Variable<String>(openingBalanceType);
    map['credit_limit'] = Variable<double>(creditLimit);
    map['credit_days'] = Variable<int>(creditDays);
    if (!nullToAbsent || priceTier != null) {
      map['price_tier'] = Variable<String>(priceTier);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      customerCode: Value(customerCode),
      tradeName: Value(tradeName),
      legalName: legalName == null && nullToAbsent
          ? const Value.absent()
          : Value(legalName),
      gstin: gstin == null && nullToAbsent
          ? const Value.absent()
          : Value(gstin),
      pan: pan == null && nullToAbsent ? const Value.absent() : Value(pan),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      contactPerson: contactPerson == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPerson),
      billingAddress: billingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddress),
      shippingAddress: shippingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingAddress),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state: state == null && nullToAbsent
          ? const Value.absent()
          : Value(state),
      stateCode: stateCode == null && nullToAbsent
          ? const Value.absent()
          : Value(stateCode),
      openingBalance: Value(openingBalance),
      openingBalanceType: Value(openingBalanceType),
      creditLimit: Value(creditLimit),
      creditDays: Value(creditDays),
      priceTier: priceTier == null && nullToAbsent
          ? const Value.absent()
          : Value(priceTier),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      customerCode: serializer.fromJson<String>(json['customerCode']),
      tradeName: serializer.fromJson<String>(json['tradeName']),
      legalName: serializer.fromJson<String?>(json['legalName']),
      gstin: serializer.fromJson<String?>(json['gstin']),
      pan: serializer.fromJson<String?>(json['pan']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      contactPerson: serializer.fromJson<String?>(json['contactPerson']),
      billingAddress: serializer.fromJson<String?>(json['billingAddress']),
      shippingAddress: serializer.fromJson<String?>(json['shippingAddress']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      stateCode: serializer.fromJson<String?>(json['stateCode']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      openingBalanceType: serializer.fromJson<String>(
        json['openingBalanceType'],
      ),
      creditLimit: serializer.fromJson<double>(json['creditLimit']),
      creditDays: serializer.fromJson<int>(json['creditDays']),
      priceTier: serializer.fromJson<String?>(json['priceTier']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerCode': serializer.toJson<String>(customerCode),
      'tradeName': serializer.toJson<String>(tradeName),
      'legalName': serializer.toJson<String?>(legalName),
      'gstin': serializer.toJson<String?>(gstin),
      'pan': serializer.toJson<String?>(pan),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'contactPerson': serializer.toJson<String?>(contactPerson),
      'billingAddress': serializer.toJson<String?>(billingAddress),
      'shippingAddress': serializer.toJson<String?>(shippingAddress),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'stateCode': serializer.toJson<String?>(stateCode),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'openingBalanceType': serializer.toJson<String>(openingBalanceType),
      'creditLimit': serializer.toJson<double>(creditLimit),
      'creditDays': serializer.toJson<int>(creditDays),
      'priceTier': serializer.toJson<String?>(priceTier),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Customer copyWith({
    int? id,
    String? customerCode,
    String? tradeName,
    Value<String?> legalName = const Value.absent(),
    Value<String?> gstin = const Value.absent(),
    Value<String?> pan = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> contactPerson = const Value.absent(),
    Value<String?> billingAddress = const Value.absent(),
    Value<String?> shippingAddress = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> stateCode = const Value.absent(),
    double? openingBalance,
    String? openingBalanceType,
    double? creditLimit,
    int? creditDays,
    Value<String?> priceTier = const Value.absent(),
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Customer(
    id: id ?? this.id,
    customerCode: customerCode ?? this.customerCode,
    tradeName: tradeName ?? this.tradeName,
    legalName: legalName.present ? legalName.value : this.legalName,
    gstin: gstin.present ? gstin.value : this.gstin,
    pan: pan.present ? pan.value : this.pan,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    contactPerson: contactPerson.present
        ? contactPerson.value
        : this.contactPerson,
    billingAddress: billingAddress.present
        ? billingAddress.value
        : this.billingAddress,
    shippingAddress: shippingAddress.present
        ? shippingAddress.value
        : this.shippingAddress,
    city: city.present ? city.value : this.city,
    state: state.present ? state.value : this.state,
    stateCode: stateCode.present ? stateCode.value : this.stateCode,
    openingBalance: openingBalance ?? this.openingBalance,
    openingBalanceType: openingBalanceType ?? this.openingBalanceType,
    creditLimit: creditLimit ?? this.creditLimit,
    creditDays: creditDays ?? this.creditDays,
    priceTier: priceTier.present ? priceTier.value : this.priceTier,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      customerCode: data.customerCode.present
          ? data.customerCode.value
          : this.customerCode,
      tradeName: data.tradeName.present ? data.tradeName.value : this.tradeName,
      legalName: data.legalName.present ? data.legalName.value : this.legalName,
      gstin: data.gstin.present ? data.gstin.value : this.gstin,
      pan: data.pan.present ? data.pan.value : this.pan,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      contactPerson: data.contactPerson.present
          ? data.contactPerson.value
          : this.contactPerson,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      shippingAddress: data.shippingAddress.present
          ? data.shippingAddress.value
          : this.shippingAddress,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      stateCode: data.stateCode.present ? data.stateCode.value : this.stateCode,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      openingBalanceType: data.openingBalanceType.present
          ? data.openingBalanceType.value
          : this.openingBalanceType,
      creditLimit: data.creditLimit.present
          ? data.creditLimit.value
          : this.creditLimit,
      creditDays: data.creditDays.present
          ? data.creditDays.value
          : this.creditDays,
      priceTier: data.priceTier.present ? data.priceTier.value : this.priceTier,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('customerCode: $customerCode, ')
          ..write('tradeName: $tradeName, ')
          ..write('legalName: $legalName, ')
          ..write('gstin: $gstin, ')
          ..write('pan: $pan, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('stateCode: $stateCode, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('openingBalanceType: $openingBalanceType, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('creditDays: $creditDays, ')
          ..write('priceTier: $priceTier, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customerCode,
    tradeName,
    legalName,
    gstin,
    pan,
    phone,
    email,
    contactPerson,
    billingAddress,
    shippingAddress,
    city,
    state,
    stateCode,
    openingBalance,
    openingBalanceType,
    creditLimit,
    creditDays,
    priceTier,
    status,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.customerCode == this.customerCode &&
          other.tradeName == this.tradeName &&
          other.legalName == this.legalName &&
          other.gstin == this.gstin &&
          other.pan == this.pan &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.contactPerson == this.contactPerson &&
          other.billingAddress == this.billingAddress &&
          other.shippingAddress == this.shippingAddress &&
          other.city == this.city &&
          other.state == this.state &&
          other.stateCode == this.stateCode &&
          other.openingBalance == this.openingBalance &&
          other.openingBalanceType == this.openingBalanceType &&
          other.creditLimit == this.creditLimit &&
          other.creditDays == this.creditDays &&
          other.priceTier == this.priceTier &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> customerCode;
  final Value<String> tradeName;
  final Value<String?> legalName;
  final Value<String?> gstin;
  final Value<String?> pan;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> contactPerson;
  final Value<String?> billingAddress;
  final Value<String?> shippingAddress;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> stateCode;
  final Value<double> openingBalance;
  final Value<String> openingBalanceType;
  final Value<double> creditLimit;
  final Value<int> creditDays;
  final Value<String?> priceTier;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.customerCode = const Value.absent(),
    this.tradeName = const Value.absent(),
    this.legalName = const Value.absent(),
    this.gstin = const Value.absent(),
    this.pan = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.stateCode = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.openingBalanceType = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.creditDays = const Value.absent(),
    this.priceTier = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String customerCode,
    required String tradeName,
    this.legalName = const Value.absent(),
    this.gstin = const Value.absent(),
    this.pan = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.stateCode = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.openingBalanceType = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.creditDays = const Value.absent(),
    this.priceTier = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : customerCode = Value(customerCode),
       tradeName = Value(tradeName);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? customerCode,
    Expression<String>? tradeName,
    Expression<String>? legalName,
    Expression<String>? gstin,
    Expression<String>? pan,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? contactPerson,
    Expression<String>? billingAddress,
    Expression<String>? shippingAddress,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? stateCode,
    Expression<double>? openingBalance,
    Expression<String>? openingBalanceType,
    Expression<double>? creditLimit,
    Expression<int>? creditDays,
    Expression<String>? priceTier,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerCode != null) 'customer_code': customerCode,
      if (tradeName != null) 'trade_name': tradeName,
      if (legalName != null) 'legal_name': legalName,
      if (gstin != null) 'gstin': gstin,
      if (pan != null) 'pan': pan,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (contactPerson != null) 'contact_person': contactPerson,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (shippingAddress != null) 'shipping_address': shippingAddress,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (stateCode != null) 'state_code': stateCode,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (openingBalanceType != null)
        'opening_balance_type': openingBalanceType,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (creditDays != null) 'credit_days': creditDays,
      if (priceTier != null) 'price_tier': priceTier,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CustomersCompanion copyWith({
    Value<int>? id,
    Value<String>? customerCode,
    Value<String>? tradeName,
    Value<String?>? legalName,
    Value<String?>? gstin,
    Value<String?>? pan,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? contactPerson,
    Value<String?>? billingAddress,
    Value<String?>? shippingAddress,
    Value<String?>? city,
    Value<String?>? state,
    Value<String?>? stateCode,
    Value<double>? openingBalance,
    Value<String>? openingBalanceType,
    Value<double>? creditLimit,
    Value<int>? creditDays,
    Value<String?>? priceTier,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      customerCode: customerCode ?? this.customerCode,
      tradeName: tradeName ?? this.tradeName,
      legalName: legalName ?? this.legalName,
      gstin: gstin ?? this.gstin,
      pan: pan ?? this.pan,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      contactPerson: contactPerson ?? this.contactPerson,
      billingAddress: billingAddress ?? this.billingAddress,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      city: city ?? this.city,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      openingBalance: openingBalance ?? this.openingBalance,
      openingBalanceType: openingBalanceType ?? this.openingBalanceType,
      creditLimit: creditLimit ?? this.creditLimit,
      creditDays: creditDays ?? this.creditDays,
      priceTier: priceTier ?? this.priceTier,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerCode.present) {
      map['customer_code'] = Variable<String>(customerCode.value);
    }
    if (tradeName.present) {
      map['trade_name'] = Variable<String>(tradeName.value);
    }
    if (legalName.present) {
      map['legal_name'] = Variable<String>(legalName.value);
    }
    if (gstin.present) {
      map['gstin'] = Variable<String>(gstin.value);
    }
    if (pan.present) {
      map['pan'] = Variable<String>(pan.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (contactPerson.present) {
      map['contact_person'] = Variable<String>(contactPerson.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (shippingAddress.present) {
      map['shipping_address'] = Variable<String>(shippingAddress.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (stateCode.present) {
      map['state_code'] = Variable<String>(stateCode.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (openingBalanceType.present) {
      map['opening_balance_type'] = Variable<String>(openingBalanceType.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<double>(creditLimit.value);
    }
    if (creditDays.present) {
      map['credit_days'] = Variable<int>(creditDays.value);
    }
    if (priceTier.present) {
      map['price_tier'] = Variable<String>(priceTier.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('customerCode: $customerCode, ')
          ..write('tradeName: $tradeName, ')
          ..write('legalName: $legalName, ')
          ..write('gstin: $gstin, ')
          ..write('pan: $pan, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('stateCode: $stateCode, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('openingBalanceType: $openingBalanceType, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('creditDays: $creditDays, ')
          ..write('priceTier: $priceTier, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hsnMeta = const VerificationMeta('hsn');
  @override
  late final GeneratedColumn<String> hsn = GeneratedColumn<String>(
    'hsn',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sacMeta = const VerificationMeta('sac');
  @override
  late final GeneratedColumn<String> sac = GeneratedColumn<String>(
    'sac',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _uomMeta = const VerificationMeta('uom');
  @override
  late final GeneratedColumn<String> uom = GeneratedColumn<String>(
    'uom',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PCS'),
  );
  static const VerificationMeta _purchaseRateMeta = const VerificationMeta(
    'purchaseRate',
  );
  @override
  late final GeneratedColumn<double> purchaseRate = GeneratedColumn<double>(
    'purchase_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sellingRateMeta = const VerificationMeta(
    'sellingRate',
  );
  @override
  late final GeneratedColumn<double> sellingRate = GeneratedColumn<double>(
    'selling_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _wholesaleRateMeta = const VerificationMeta(
    'wholesaleRate',
  );
  @override
  late final GeneratedColumn<double> wholesaleRate = GeneratedColumn<double>(
    'wholesale_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _gstRateMeta = const VerificationMeta(
    'gstRate',
  );
  @override
  late final GeneratedColumn<double> gstRate = GeneratedColumn<double>(
    'gst_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _openingStockMeta = const VerificationMeta(
    'openingStock',
  );
  @override
  late final GeneratedColumn<double> openingStock = GeneratedColumn<double>(
    'opening_stock',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _currentStockMeta = const VerificationMeta(
    'currentStock',
  );
  @override
  late final GeneratedColumn<double> currentStock = GeneratedColumn<double>(
    'current_stock',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _minimumStockMeta = const VerificationMeta(
    'minimumStock',
  );
  @override
  late final GeneratedColumn<double> minimumStock = GeneratedColumn<double>(
    'minimum_stock',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sku,
    barcode,
    productName,
    description,
    hsn,
    sac,
    uom,
    purchaseRate,
    sellingRate,
    wholesaleRate,
    gstRate,
    openingStock,
    currentStock,
    minimumStock,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('hsn')) {
      context.handle(
        _hsnMeta,
        hsn.isAcceptableOrUnknown(data['hsn']!, _hsnMeta),
      );
    }
    if (data.containsKey('sac')) {
      context.handle(
        _sacMeta,
        sac.isAcceptableOrUnknown(data['sac']!, _sacMeta),
      );
    }
    if (data.containsKey('uom')) {
      context.handle(
        _uomMeta,
        uom.isAcceptableOrUnknown(data['uom']!, _uomMeta),
      );
    }
    if (data.containsKey('purchase_rate')) {
      context.handle(
        _purchaseRateMeta,
        purchaseRate.isAcceptableOrUnknown(
          data['purchase_rate']!,
          _purchaseRateMeta,
        ),
      );
    }
    if (data.containsKey('selling_rate')) {
      context.handle(
        _sellingRateMeta,
        sellingRate.isAcceptableOrUnknown(
          data['selling_rate']!,
          _sellingRateMeta,
        ),
      );
    }
    if (data.containsKey('wholesale_rate')) {
      context.handle(
        _wholesaleRateMeta,
        wholesaleRate.isAcceptableOrUnknown(
          data['wholesale_rate']!,
          _wholesaleRateMeta,
        ),
      );
    }
    if (data.containsKey('gst_rate')) {
      context.handle(
        _gstRateMeta,
        gstRate.isAcceptableOrUnknown(data['gst_rate']!, _gstRateMeta),
      );
    }
    if (data.containsKey('opening_stock')) {
      context.handle(
        _openingStockMeta,
        openingStock.isAcceptableOrUnknown(
          data['opening_stock']!,
          _openingStockMeta,
        ),
      );
    }
    if (data.containsKey('current_stock')) {
      context.handle(
        _currentStockMeta,
        currentStock.isAcceptableOrUnknown(
          data['current_stock']!,
          _currentStockMeta,
        ),
      );
    }
    if (data.containsKey('minimum_stock')) {
      context.handle(
        _minimumStockMeta,
        minimumStock.isAcceptableOrUnknown(
          data['minimum_stock']!,
          _minimumStockMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      hsn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hsn'],
      ),
      sac: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sac'],
      ),
      uom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uom'],
      )!,
      purchaseRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purchase_rate'],
      )!,
      sellingRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}selling_rate'],
      )!,
      wholesaleRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wholesale_rate'],
      )!,
      gstRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gst_rate'],
      )!,
      openingStock: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}opening_stock'],
      )!,
      currentStock: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_stock'],
      )!,
      minimumStock: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}minimum_stock'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String sku;
  final String? barcode;
  final String productName;
  final String? description;
  final String? hsn;
  final String? sac;
  final String uom;
  final double purchaseRate;
  final double sellingRate;
  final double wholesaleRate;
  final double gstRate;
  final double openingStock;
  final double currentStock;
  final double minimumStock;
  final String status;
  const Product({
    required this.id,
    required this.sku,
    this.barcode,
    required this.productName,
    this.description,
    this.hsn,
    this.sac,
    required this.uom,
    required this.purchaseRate,
    required this.sellingRate,
    required this.wholesaleRate,
    required this.gstRate,
    required this.openingStock,
    required this.currentStock,
    required this.minimumStock,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sku'] = Variable<String>(sku);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['product_name'] = Variable<String>(productName);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || hsn != null) {
      map['hsn'] = Variable<String>(hsn);
    }
    if (!nullToAbsent || sac != null) {
      map['sac'] = Variable<String>(sac);
    }
    map['uom'] = Variable<String>(uom);
    map['purchase_rate'] = Variable<double>(purchaseRate);
    map['selling_rate'] = Variable<double>(sellingRate);
    map['wholesale_rate'] = Variable<double>(wholesaleRate);
    map['gst_rate'] = Variable<double>(gstRate);
    map['opening_stock'] = Variable<double>(openingStock);
    map['current_stock'] = Variable<double>(currentStock);
    map['minimum_stock'] = Variable<double>(minimumStock);
    map['status'] = Variable<String>(status);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      sku: Value(sku),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      productName: Value(productName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      hsn: hsn == null && nullToAbsent ? const Value.absent() : Value(hsn),
      sac: sac == null && nullToAbsent ? const Value.absent() : Value(sac),
      uom: Value(uom),
      purchaseRate: Value(purchaseRate),
      sellingRate: Value(sellingRate),
      wholesaleRate: Value(wholesaleRate),
      gstRate: Value(gstRate),
      openingStock: Value(openingStock),
      currentStock: Value(currentStock),
      minimumStock: Value(minimumStock),
      status: Value(status),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      sku: serializer.fromJson<String>(json['sku']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      productName: serializer.fromJson<String>(json['productName']),
      description: serializer.fromJson<String?>(json['description']),
      hsn: serializer.fromJson<String?>(json['hsn']),
      sac: serializer.fromJson<String?>(json['sac']),
      uom: serializer.fromJson<String>(json['uom']),
      purchaseRate: serializer.fromJson<double>(json['purchaseRate']),
      sellingRate: serializer.fromJson<double>(json['sellingRate']),
      wholesaleRate: serializer.fromJson<double>(json['wholesaleRate']),
      gstRate: serializer.fromJson<double>(json['gstRate']),
      openingStock: serializer.fromJson<double>(json['openingStock']),
      currentStock: serializer.fromJson<double>(json['currentStock']),
      minimumStock: serializer.fromJson<double>(json['minimumStock']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sku': serializer.toJson<String>(sku),
      'barcode': serializer.toJson<String?>(barcode),
      'productName': serializer.toJson<String>(productName),
      'description': serializer.toJson<String?>(description),
      'hsn': serializer.toJson<String?>(hsn),
      'sac': serializer.toJson<String?>(sac),
      'uom': serializer.toJson<String>(uom),
      'purchaseRate': serializer.toJson<double>(purchaseRate),
      'sellingRate': serializer.toJson<double>(sellingRate),
      'wholesaleRate': serializer.toJson<double>(wholesaleRate),
      'gstRate': serializer.toJson<double>(gstRate),
      'openingStock': serializer.toJson<double>(openingStock),
      'currentStock': serializer.toJson<double>(currentStock),
      'minimumStock': serializer.toJson<double>(minimumStock),
      'status': serializer.toJson<String>(status),
    };
  }

  Product copyWith({
    int? id,
    String? sku,
    Value<String?> barcode = const Value.absent(),
    String? productName,
    Value<String?> description = const Value.absent(),
    Value<String?> hsn = const Value.absent(),
    Value<String?> sac = const Value.absent(),
    String? uom,
    double? purchaseRate,
    double? sellingRate,
    double? wholesaleRate,
    double? gstRate,
    double? openingStock,
    double? currentStock,
    double? minimumStock,
    String? status,
  }) => Product(
    id: id ?? this.id,
    sku: sku ?? this.sku,
    barcode: barcode.present ? barcode.value : this.barcode,
    productName: productName ?? this.productName,
    description: description.present ? description.value : this.description,
    hsn: hsn.present ? hsn.value : this.hsn,
    sac: sac.present ? sac.value : this.sac,
    uom: uom ?? this.uom,
    purchaseRate: purchaseRate ?? this.purchaseRate,
    sellingRate: sellingRate ?? this.sellingRate,
    wholesaleRate: wholesaleRate ?? this.wholesaleRate,
    gstRate: gstRate ?? this.gstRate,
    openingStock: openingStock ?? this.openingStock,
    currentStock: currentStock ?? this.currentStock,
    minimumStock: minimumStock ?? this.minimumStock,
    status: status ?? this.status,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      sku: data.sku.present ? data.sku.value : this.sku,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      description: data.description.present
          ? data.description.value
          : this.description,
      hsn: data.hsn.present ? data.hsn.value : this.hsn,
      sac: data.sac.present ? data.sac.value : this.sac,
      uom: data.uom.present ? data.uom.value : this.uom,
      purchaseRate: data.purchaseRate.present
          ? data.purchaseRate.value
          : this.purchaseRate,
      sellingRate: data.sellingRate.present
          ? data.sellingRate.value
          : this.sellingRate,
      wholesaleRate: data.wholesaleRate.present
          ? data.wholesaleRate.value
          : this.wholesaleRate,
      gstRate: data.gstRate.present ? data.gstRate.value : this.gstRate,
      openingStock: data.openingStock.present
          ? data.openingStock.value
          : this.openingStock,
      currentStock: data.currentStock.present
          ? data.currentStock.value
          : this.currentStock,
      minimumStock: data.minimumStock.present
          ? data.minimumStock.value
          : this.minimumStock,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('productName: $productName, ')
          ..write('description: $description, ')
          ..write('hsn: $hsn, ')
          ..write('sac: $sac, ')
          ..write('uom: $uom, ')
          ..write('purchaseRate: $purchaseRate, ')
          ..write('sellingRate: $sellingRate, ')
          ..write('wholesaleRate: $wholesaleRate, ')
          ..write('gstRate: $gstRate, ')
          ..write('openingStock: $openingStock, ')
          ..write('currentStock: $currentStock, ')
          ..write('minimumStock: $minimumStock, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sku,
    barcode,
    productName,
    description,
    hsn,
    sac,
    uom,
    purchaseRate,
    sellingRate,
    wholesaleRate,
    gstRate,
    openingStock,
    currentStock,
    minimumStock,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.sku == this.sku &&
          other.barcode == this.barcode &&
          other.productName == this.productName &&
          other.description == this.description &&
          other.hsn == this.hsn &&
          other.sac == this.sac &&
          other.uom == this.uom &&
          other.purchaseRate == this.purchaseRate &&
          other.sellingRate == this.sellingRate &&
          other.wholesaleRate == this.wholesaleRate &&
          other.gstRate == this.gstRate &&
          other.openingStock == this.openingStock &&
          other.currentStock == this.currentStock &&
          other.minimumStock == this.minimumStock &&
          other.status == this.status);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> sku;
  final Value<String?> barcode;
  final Value<String> productName;
  final Value<String?> description;
  final Value<String?> hsn;
  final Value<String?> sac;
  final Value<String> uom;
  final Value<double> purchaseRate;
  final Value<double> sellingRate;
  final Value<double> wholesaleRate;
  final Value<double> gstRate;
  final Value<double> openingStock;
  final Value<double> currentStock;
  final Value<double> minimumStock;
  final Value<String> status;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.productName = const Value.absent(),
    this.description = const Value.absent(),
    this.hsn = const Value.absent(),
    this.sac = const Value.absent(),
    this.uom = const Value.absent(),
    this.purchaseRate = const Value.absent(),
    this.sellingRate = const Value.absent(),
    this.wholesaleRate = const Value.absent(),
    this.gstRate = const Value.absent(),
    this.openingStock = const Value.absent(),
    this.currentStock = const Value.absent(),
    this.minimumStock = const Value.absent(),
    this.status = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String sku,
    this.barcode = const Value.absent(),
    required String productName,
    this.description = const Value.absent(),
    this.hsn = const Value.absent(),
    this.sac = const Value.absent(),
    this.uom = const Value.absent(),
    this.purchaseRate = const Value.absent(),
    this.sellingRate = const Value.absent(),
    this.wholesaleRate = const Value.absent(),
    this.gstRate = const Value.absent(),
    this.openingStock = const Value.absent(),
    this.currentStock = const Value.absent(),
    this.minimumStock = const Value.absent(),
    this.status = const Value.absent(),
  }) : sku = Value(sku),
       productName = Value(productName);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? sku,
    Expression<String>? barcode,
    Expression<String>? productName,
    Expression<String>? description,
    Expression<String>? hsn,
    Expression<String>? sac,
    Expression<String>? uom,
    Expression<double>? purchaseRate,
    Expression<double>? sellingRate,
    Expression<double>? wholesaleRate,
    Expression<double>? gstRate,
    Expression<double>? openingStock,
    Expression<double>? currentStock,
    Expression<double>? minimumStock,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (productName != null) 'product_name': productName,
      if (description != null) 'description': description,
      if (hsn != null) 'hsn': hsn,
      if (sac != null) 'sac': sac,
      if (uom != null) 'uom': uom,
      if (purchaseRate != null) 'purchase_rate': purchaseRate,
      if (sellingRate != null) 'selling_rate': sellingRate,
      if (wholesaleRate != null) 'wholesale_rate': wholesaleRate,
      if (gstRate != null) 'gst_rate': gstRate,
      if (openingStock != null) 'opening_stock': openingStock,
      if (currentStock != null) 'current_stock': currentStock,
      if (minimumStock != null) 'minimum_stock': minimumStock,
      if (status != null) 'status': status,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String>? sku,
    Value<String?>? barcode,
    Value<String>? productName,
    Value<String?>? description,
    Value<String?>? hsn,
    Value<String?>? sac,
    Value<String>? uom,
    Value<double>? purchaseRate,
    Value<double>? sellingRate,
    Value<double>? wholesaleRate,
    Value<double>? gstRate,
    Value<double>? openingStock,
    Value<double>? currentStock,
    Value<double>? minimumStock,
    Value<String>? status,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      hsn: hsn ?? this.hsn,
      sac: sac ?? this.sac,
      uom: uom ?? this.uom,
      purchaseRate: purchaseRate ?? this.purchaseRate,
      sellingRate: sellingRate ?? this.sellingRate,
      wholesaleRate: wholesaleRate ?? this.wholesaleRate,
      gstRate: gstRate ?? this.gstRate,
      openingStock: openingStock ?? this.openingStock,
      currentStock: currentStock ?? this.currentStock,
      minimumStock: minimumStock ?? this.minimumStock,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (hsn.present) {
      map['hsn'] = Variable<String>(hsn.value);
    }
    if (sac.present) {
      map['sac'] = Variable<String>(sac.value);
    }
    if (uom.present) {
      map['uom'] = Variable<String>(uom.value);
    }
    if (purchaseRate.present) {
      map['purchase_rate'] = Variable<double>(purchaseRate.value);
    }
    if (sellingRate.present) {
      map['selling_rate'] = Variable<double>(sellingRate.value);
    }
    if (wholesaleRate.present) {
      map['wholesale_rate'] = Variable<double>(wholesaleRate.value);
    }
    if (gstRate.present) {
      map['gst_rate'] = Variable<double>(gstRate.value);
    }
    if (openingStock.present) {
      map['opening_stock'] = Variable<double>(openingStock.value);
    }
    if (currentStock.present) {
      map['current_stock'] = Variable<double>(currentStock.value);
    }
    if (minimumStock.present) {
      map['minimum_stock'] = Variable<double>(minimumStock.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('productName: $productName, ')
          ..write('description: $description, ')
          ..write('hsn: $hsn, ')
          ..write('sac: $sac, ')
          ..write('uom: $uom, ')
          ..write('purchaseRate: $purchaseRate, ')
          ..write('sellingRate: $sellingRate, ')
          ..write('wholesaleRate: $wholesaleRate, ')
          ..write('gstRate: $gstRate, ')
          ..write('openingStock: $openingStock, ')
          ..write('currentStock: $currentStock, ')
          ..write('minimumStock: $minimumStock, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceNumberMeta = const VerificationMeta(
    'invoiceNumber',
  );
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
    'invoice_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _financialYearIdMeta = const VerificationMeta(
    'financialYearId',
  );
  @override
  late final GeneratedColumn<int> financialYearId = GeneratedColumn<int>(
    'financial_year_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES financial_years (id)',
    ),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customers (id)',
    ),
  );
  static const VerificationMeta _invoiceDateMeta = const VerificationMeta(
    'invoiceDate',
  );
  @override
  late final GeneratedColumn<DateTime> invoiceDate = GeneratedColumn<DateTime>(
    'invoice_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salesExecutiveMeta = const VerificationMeta(
    'salesExecutive',
  );
  @override
  late final GeneratedColumn<String> salesExecutive = GeneratedColumn<String>(
    'sales_executive',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _taxableAmountMeta = const VerificationMeta(
    'taxableAmount',
  );
  @override
  late final GeneratedColumn<double> taxableAmount = GeneratedColumn<double>(
    'taxable_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _cgstMeta = const VerificationMeta('cgst');
  @override
  late final GeneratedColumn<double> cgst = GeneratedColumn<double>(
    'cgst',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sgstMeta = const VerificationMeta('sgst');
  @override
  late final GeneratedColumn<double> sgst = GeneratedColumn<double>(
    'sgst',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _igstMeta = const VerificationMeta('igst');
  @override
  late final GeneratedColumn<double> igst = GeneratedColumn<double>(
    'igst',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _roundOffMeta = const VerificationMeta(
    'roundOff',
  );
  @override
  late final GeneratedColumn<double> roundOff = GeneratedColumn<double>(
    'round_off',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _grandTotalMeta = const VerificationMeta(
    'grandTotal',
  );
  @override
  late final GeneratedColumn<double> grandTotal = GeneratedColumn<double>(
    'grand_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _amountReceivedMeta = const VerificationMeta(
    'amountReceived',
  );
  @override
  late final GeneratedColumn<double> amountReceived = GeneratedColumn<double>(
    'amount_received',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _balanceDueMeta = const VerificationMeta(
    'balanceDue',
  );
  @override
  late final GeneratedColumn<double> balanceDue = GeneratedColumn<double>(
    'balance_due',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _paymentStatusMeta = const VerificationMeta(
    'paymentStatus',
  );
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
    'payment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  static const VerificationMeta _placeOfSupplyMeta = const VerificationMeta(
    'placeOfSupply',
  );
  @override
  late final GeneratedColumn<String> placeOfSupply = GeneratedColumn<String>(
    'place_of_supply',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ewayBillRequiredMeta = const VerificationMeta(
    'ewayBillRequired',
  );
  @override
  late final GeneratedColumn<bool> ewayBillRequired = GeneratedColumn<bool>(
    'eway_bill_required',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("eway_bill_required" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceNumber,
    financialYearId,
    customerId,
    invoiceDate,
    dueDate,
    salesExecutive,
    subtotal,
    discount,
    taxableAmount,
    cgst,
    sgst,
    igst,
    roundOff,
    grandTotal,
    amountReceived,
    balanceDue,
    paymentStatus,
    placeOfSupply,
    paymentMethod,
    ewayBillRequired,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Invoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
        _invoiceNumberMeta,
        invoiceNumber.isAcceptableOrUnknown(
          data['invoice_number']!,
          _invoiceNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('financial_year_id')) {
      context.handle(
        _financialYearIdMeta,
        financialYearId.isAcceptableOrUnknown(
          data['financial_year_id']!,
          _financialYearIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_financialYearIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('invoice_date')) {
      context.handle(
        _invoiceDateMeta,
        invoiceDate.isAcceptableOrUnknown(
          data['invoice_date']!,
          _invoiceDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('sales_executive')) {
      context.handle(
        _salesExecutiveMeta,
        salesExecutive.isAcceptableOrUnknown(
          data['sales_executive']!,
          _salesExecutiveMeta,
        ),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('taxable_amount')) {
      context.handle(
        _taxableAmountMeta,
        taxableAmount.isAcceptableOrUnknown(
          data['taxable_amount']!,
          _taxableAmountMeta,
        ),
      );
    }
    if (data.containsKey('cgst')) {
      context.handle(
        _cgstMeta,
        cgst.isAcceptableOrUnknown(data['cgst']!, _cgstMeta),
      );
    }
    if (data.containsKey('sgst')) {
      context.handle(
        _sgstMeta,
        sgst.isAcceptableOrUnknown(data['sgst']!, _sgstMeta),
      );
    }
    if (data.containsKey('igst')) {
      context.handle(
        _igstMeta,
        igst.isAcceptableOrUnknown(data['igst']!, _igstMeta),
      );
    }
    if (data.containsKey('round_off')) {
      context.handle(
        _roundOffMeta,
        roundOff.isAcceptableOrUnknown(data['round_off']!, _roundOffMeta),
      );
    }
    if (data.containsKey('grand_total')) {
      context.handle(
        _grandTotalMeta,
        grandTotal.isAcceptableOrUnknown(data['grand_total']!, _grandTotalMeta),
      );
    }
    if (data.containsKey('amount_received')) {
      context.handle(
        _amountReceivedMeta,
        amountReceived.isAcceptableOrUnknown(
          data['amount_received']!,
          _amountReceivedMeta,
        ),
      );
    }
    if (data.containsKey('balance_due')) {
      context.handle(
        _balanceDueMeta,
        balanceDue.isAcceptableOrUnknown(data['balance_due']!, _balanceDueMeta),
      );
    }
    if (data.containsKey('payment_status')) {
      context.handle(
        _paymentStatusMeta,
        paymentStatus.isAcceptableOrUnknown(
          data['payment_status']!,
          _paymentStatusMeta,
        ),
      );
    }
    if (data.containsKey('place_of_supply')) {
      context.handle(
        _placeOfSupplyMeta,
        placeOfSupply.isAcceptableOrUnknown(
          data['place_of_supply']!,
          _placeOfSupplyMeta,
        ),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('eway_bill_required')) {
      context.handle(
        _ewayBillRequiredMeta,
        ewayBillRequired.isAcceptableOrUnknown(
          data['eway_bill_required']!,
          _ewayBillRequiredMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_number'],
      )!,
      financialYearId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}financial_year_id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      )!,
      invoiceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}invoice_date'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
      salesExecutive: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sales_executive'],
      ),
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      )!,
      taxableAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}taxable_amount'],
      )!,
      cgst: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cgst'],
      )!,
      sgst: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sgst'],
      )!,
      igst: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}igst'],
      )!,
      roundOff: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}round_off'],
      )!,
      grandTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grand_total'],
      )!,
      amountReceived: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount_received'],
      )!,
      balanceDue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}balance_due'],
      )!,
      paymentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_status'],
      )!,
      placeOfSupply: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_of_supply'],
      ),
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      ),
      ewayBillRequired: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}eway_bill_required'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final int id;
  final String invoiceNumber;
  final int financialYearId;
  final int customerId;
  final DateTime invoiceDate;
  final DateTime dueDate;
  final String? salesExecutive;
  final double subtotal;
  final double discount;
  final double taxableAmount;
  final double cgst;
  final double sgst;
  final double igst;
  final double roundOff;
  final double grandTotal;
  final double amountReceived;
  final double balanceDue;
  final String paymentStatus;
  final String? placeOfSupply;
  final String? paymentMethod;
  final bool ewayBillRequired;
  final String? notes;
  final DateTime createdAt;
  const Invoice({
    required this.id,
    required this.invoiceNumber,
    required this.financialYearId,
    required this.customerId,
    required this.invoiceDate,
    required this.dueDate,
    this.salesExecutive,
    required this.subtotal,
    required this.discount,
    required this.taxableAmount,
    required this.cgst,
    required this.sgst,
    required this.igst,
    required this.roundOff,
    required this.grandTotal,
    required this.amountReceived,
    required this.balanceDue,
    required this.paymentStatus,
    this.placeOfSupply,
    this.paymentMethod,
    required this.ewayBillRequired,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    map['financial_year_id'] = Variable<int>(financialYearId);
    map['customer_id'] = Variable<int>(customerId);
    map['invoice_date'] = Variable<DateTime>(invoiceDate);
    map['due_date'] = Variable<DateTime>(dueDate);
    if (!nullToAbsent || salesExecutive != null) {
      map['sales_executive'] = Variable<String>(salesExecutive);
    }
    map['subtotal'] = Variable<double>(subtotal);
    map['discount'] = Variable<double>(discount);
    map['taxable_amount'] = Variable<double>(taxableAmount);
    map['cgst'] = Variable<double>(cgst);
    map['sgst'] = Variable<double>(sgst);
    map['igst'] = Variable<double>(igst);
    map['round_off'] = Variable<double>(roundOff);
    map['grand_total'] = Variable<double>(grandTotal);
    map['amount_received'] = Variable<double>(amountReceived);
    map['balance_due'] = Variable<double>(balanceDue);
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || placeOfSupply != null) {
      map['place_of_supply'] = Variable<String>(placeOfSupply);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    map['eway_bill_required'] = Variable<bool>(ewayBillRequired);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      invoiceNumber: Value(invoiceNumber),
      financialYearId: Value(financialYearId),
      customerId: Value(customerId),
      invoiceDate: Value(invoiceDate),
      dueDate: Value(dueDate),
      salesExecutive: salesExecutive == null && nullToAbsent
          ? const Value.absent()
          : Value(salesExecutive),
      subtotal: Value(subtotal),
      discount: Value(discount),
      taxableAmount: Value(taxableAmount),
      cgst: Value(cgst),
      sgst: Value(sgst),
      igst: Value(igst),
      roundOff: Value(roundOff),
      grandTotal: Value(grandTotal),
      amountReceived: Value(amountReceived),
      balanceDue: Value(balanceDue),
      paymentStatus: Value(paymentStatus),
      placeOfSupply: placeOfSupply == null && nullToAbsent
          ? const Value.absent()
          : Value(placeOfSupply),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      ewayBillRequired: Value(ewayBillRequired),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Invoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<int>(json['id']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      financialYearId: serializer.fromJson<int>(json['financialYearId']),
      customerId: serializer.fromJson<int>(json['customerId']),
      invoiceDate: serializer.fromJson<DateTime>(json['invoiceDate']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      salesExecutive: serializer.fromJson<String?>(json['salesExecutive']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discount: serializer.fromJson<double>(json['discount']),
      taxableAmount: serializer.fromJson<double>(json['taxableAmount']),
      cgst: serializer.fromJson<double>(json['cgst']),
      sgst: serializer.fromJson<double>(json['sgst']),
      igst: serializer.fromJson<double>(json['igst']),
      roundOff: serializer.fromJson<double>(json['roundOff']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      amountReceived: serializer.fromJson<double>(json['amountReceived']),
      balanceDue: serializer.fromJson<double>(json['balanceDue']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      placeOfSupply: serializer.fromJson<String?>(json['placeOfSupply']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      ewayBillRequired: serializer.fromJson<bool>(json['ewayBillRequired']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'financialYearId': serializer.toJson<int>(financialYearId),
      'customerId': serializer.toJson<int>(customerId),
      'invoiceDate': serializer.toJson<DateTime>(invoiceDate),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'salesExecutive': serializer.toJson<String?>(salesExecutive),
      'subtotal': serializer.toJson<double>(subtotal),
      'discount': serializer.toJson<double>(discount),
      'taxableAmount': serializer.toJson<double>(taxableAmount),
      'cgst': serializer.toJson<double>(cgst),
      'sgst': serializer.toJson<double>(sgst),
      'igst': serializer.toJson<double>(igst),
      'roundOff': serializer.toJson<double>(roundOff),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'amountReceived': serializer.toJson<double>(amountReceived),
      'balanceDue': serializer.toJson<double>(balanceDue),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'placeOfSupply': serializer.toJson<String?>(placeOfSupply),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'ewayBillRequired': serializer.toJson<bool>(ewayBillRequired),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Invoice copyWith({
    int? id,
    String? invoiceNumber,
    int? financialYearId,
    int? customerId,
    DateTime? invoiceDate,
    DateTime? dueDate,
    Value<String?> salesExecutive = const Value.absent(),
    double? subtotal,
    double? discount,
    double? taxableAmount,
    double? cgst,
    double? sgst,
    double? igst,
    double? roundOff,
    double? grandTotal,
    double? amountReceived,
    double? balanceDue,
    String? paymentStatus,
    Value<String?> placeOfSupply = const Value.absent(),
    Value<String?> paymentMethod = const Value.absent(),
    bool? ewayBillRequired,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => Invoice(
    id: id ?? this.id,
    invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    financialYearId: financialYearId ?? this.financialYearId,
    customerId: customerId ?? this.customerId,
    invoiceDate: invoiceDate ?? this.invoiceDate,
    dueDate: dueDate ?? this.dueDate,
    salesExecutive: salesExecutive.present
        ? salesExecutive.value
        : this.salesExecutive,
    subtotal: subtotal ?? this.subtotal,
    discount: discount ?? this.discount,
    taxableAmount: taxableAmount ?? this.taxableAmount,
    cgst: cgst ?? this.cgst,
    sgst: sgst ?? this.sgst,
    igst: igst ?? this.igst,
    roundOff: roundOff ?? this.roundOff,
    grandTotal: grandTotal ?? this.grandTotal,
    amountReceived: amountReceived ?? this.amountReceived,
    balanceDue: balanceDue ?? this.balanceDue,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    placeOfSupply: placeOfSupply.present
        ? placeOfSupply.value
        : this.placeOfSupply,
    paymentMethod: paymentMethod.present
        ? paymentMethod.value
        : this.paymentMethod,
    ewayBillRequired: ewayBillRequired ?? this.ewayBillRequired,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      financialYearId: data.financialYearId.present
          ? data.financialYearId.value
          : this.financialYearId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      invoiceDate: data.invoiceDate.present
          ? data.invoiceDate.value
          : this.invoiceDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      salesExecutive: data.salesExecutive.present
          ? data.salesExecutive.value
          : this.salesExecutive,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      taxableAmount: data.taxableAmount.present
          ? data.taxableAmount.value
          : this.taxableAmount,
      cgst: data.cgst.present ? data.cgst.value : this.cgst,
      sgst: data.sgst.present ? data.sgst.value : this.sgst,
      igst: data.igst.present ? data.igst.value : this.igst,
      roundOff: data.roundOff.present ? data.roundOff.value : this.roundOff,
      grandTotal: data.grandTotal.present
          ? data.grandTotal.value
          : this.grandTotal,
      amountReceived: data.amountReceived.present
          ? data.amountReceived.value
          : this.amountReceived,
      balanceDue: data.balanceDue.present
          ? data.balanceDue.value
          : this.balanceDue,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      placeOfSupply: data.placeOfSupply.present
          ? data.placeOfSupply.value
          : this.placeOfSupply,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      ewayBillRequired: data.ewayBillRequired.present
          ? data.ewayBillRequired.value
          : this.ewayBillRequired,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('financialYearId: $financialYearId, ')
          ..write('customerId: $customerId, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('salesExecutive: $salesExecutive, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('taxableAmount: $taxableAmount, ')
          ..write('cgst: $cgst, ')
          ..write('sgst: $sgst, ')
          ..write('igst: $igst, ')
          ..write('roundOff: $roundOff, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('balanceDue: $balanceDue, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('placeOfSupply: $placeOfSupply, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('ewayBillRequired: $ewayBillRequired, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    invoiceNumber,
    financialYearId,
    customerId,
    invoiceDate,
    dueDate,
    salesExecutive,
    subtotal,
    discount,
    taxableAmount,
    cgst,
    sgst,
    igst,
    roundOff,
    grandTotal,
    amountReceived,
    balanceDue,
    paymentStatus,
    placeOfSupply,
    paymentMethod,
    ewayBillRequired,
    notes,
    createdAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.invoiceNumber == this.invoiceNumber &&
          other.financialYearId == this.financialYearId &&
          other.customerId == this.customerId &&
          other.invoiceDate == this.invoiceDate &&
          other.dueDate == this.dueDate &&
          other.salesExecutive == this.salesExecutive &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.taxableAmount == this.taxableAmount &&
          other.cgst == this.cgst &&
          other.sgst == this.sgst &&
          other.igst == this.igst &&
          other.roundOff == this.roundOff &&
          other.grandTotal == this.grandTotal &&
          other.amountReceived == this.amountReceived &&
          other.balanceDue == this.balanceDue &&
          other.paymentStatus == this.paymentStatus &&
          other.placeOfSupply == this.placeOfSupply &&
          other.paymentMethod == this.paymentMethod &&
          other.ewayBillRequired == this.ewayBillRequired &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<int> id;
  final Value<String> invoiceNumber;
  final Value<int> financialYearId;
  final Value<int> customerId;
  final Value<DateTime> invoiceDate;
  final Value<DateTime> dueDate;
  final Value<String?> salesExecutive;
  final Value<double> subtotal;
  final Value<double> discount;
  final Value<double> taxableAmount;
  final Value<double> cgst;
  final Value<double> sgst;
  final Value<double> igst;
  final Value<double> roundOff;
  final Value<double> grandTotal;
  final Value<double> amountReceived;
  final Value<double> balanceDue;
  final Value<String> paymentStatus;
  final Value<String?> placeOfSupply;
  final Value<String?> paymentMethod;
  final Value<bool> ewayBillRequired;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.financialYearId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.invoiceDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.salesExecutive = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.taxableAmount = const Value.absent(),
    this.cgst = const Value.absent(),
    this.sgst = const Value.absent(),
    this.igst = const Value.absent(),
    this.roundOff = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.amountReceived = const Value.absent(),
    this.balanceDue = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.placeOfSupply = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.ewayBillRequired = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceNumber,
    required int financialYearId,
    required int customerId,
    required DateTime invoiceDate,
    required DateTime dueDate,
    this.salesExecutive = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.taxableAmount = const Value.absent(),
    this.cgst = const Value.absent(),
    this.sgst = const Value.absent(),
    this.igst = const Value.absent(),
    this.roundOff = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.amountReceived = const Value.absent(),
    this.balanceDue = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.placeOfSupply = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.ewayBillRequired = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : invoiceNumber = Value(invoiceNumber),
       financialYearId = Value(financialYearId),
       customerId = Value(customerId),
       invoiceDate = Value(invoiceDate),
       dueDate = Value(dueDate);
  static Insertable<Invoice> custom({
    Expression<int>? id,
    Expression<String>? invoiceNumber,
    Expression<int>? financialYearId,
    Expression<int>? customerId,
    Expression<DateTime>? invoiceDate,
    Expression<DateTime>? dueDate,
    Expression<String>? salesExecutive,
    Expression<double>? subtotal,
    Expression<double>? discount,
    Expression<double>? taxableAmount,
    Expression<double>? cgst,
    Expression<double>? sgst,
    Expression<double>? igst,
    Expression<double>? roundOff,
    Expression<double>? grandTotal,
    Expression<double>? amountReceived,
    Expression<double>? balanceDue,
    Expression<String>? paymentStatus,
    Expression<String>? placeOfSupply,
    Expression<String>? paymentMethod,
    Expression<bool>? ewayBillRequired,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (financialYearId != null) 'financial_year_id': financialYearId,
      if (customerId != null) 'customer_id': customerId,
      if (invoiceDate != null) 'invoice_date': invoiceDate,
      if (dueDate != null) 'due_date': dueDate,
      if (salesExecutive != null) 'sales_executive': salesExecutive,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (taxableAmount != null) 'taxable_amount': taxableAmount,
      if (cgst != null) 'cgst': cgst,
      if (sgst != null) 'sgst': sgst,
      if (igst != null) 'igst': igst,
      if (roundOff != null) 'round_off': roundOff,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (amountReceived != null) 'amount_received': amountReceived,
      if (balanceDue != null) 'balance_due': balanceDue,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (placeOfSupply != null) 'place_of_supply': placeOfSupply,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (ewayBillRequired != null) 'eway_bill_required': ewayBillRequired,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  InvoicesCompanion copyWith({
    Value<int>? id,
    Value<String>? invoiceNumber,
    Value<int>? financialYearId,
    Value<int>? customerId,
    Value<DateTime>? invoiceDate,
    Value<DateTime>? dueDate,
    Value<String?>? salesExecutive,
    Value<double>? subtotal,
    Value<double>? discount,
    Value<double>? taxableAmount,
    Value<double>? cgst,
    Value<double>? sgst,
    Value<double>? igst,
    Value<double>? roundOff,
    Value<double>? grandTotal,
    Value<double>? amountReceived,
    Value<double>? balanceDue,
    Value<String>? paymentStatus,
    Value<String?>? placeOfSupply,
    Value<String?>? paymentMethod,
    Value<bool>? ewayBillRequired,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      financialYearId: financialYearId ?? this.financialYearId,
      customerId: customerId ?? this.customerId,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      dueDate: dueDate ?? this.dueDate,
      salesExecutive: salesExecutive ?? this.salesExecutive,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      taxableAmount: taxableAmount ?? this.taxableAmount,
      cgst: cgst ?? this.cgst,
      sgst: sgst ?? this.sgst,
      igst: igst ?? this.igst,
      roundOff: roundOff ?? this.roundOff,
      grandTotal: grandTotal ?? this.grandTotal,
      amountReceived: amountReceived ?? this.amountReceived,
      balanceDue: balanceDue ?? this.balanceDue,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      placeOfSupply: placeOfSupply ?? this.placeOfSupply,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      ewayBillRequired: ewayBillRequired ?? this.ewayBillRequired,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (financialYearId.present) {
      map['financial_year_id'] = Variable<int>(financialYearId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (invoiceDate.present) {
      map['invoice_date'] = Variable<DateTime>(invoiceDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (salesExecutive.present) {
      map['sales_executive'] = Variable<String>(salesExecutive.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (taxableAmount.present) {
      map['taxable_amount'] = Variable<double>(taxableAmount.value);
    }
    if (cgst.present) {
      map['cgst'] = Variable<double>(cgst.value);
    }
    if (sgst.present) {
      map['sgst'] = Variable<double>(sgst.value);
    }
    if (igst.present) {
      map['igst'] = Variable<double>(igst.value);
    }
    if (roundOff.present) {
      map['round_off'] = Variable<double>(roundOff.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (amountReceived.present) {
      map['amount_received'] = Variable<double>(amountReceived.value);
    }
    if (balanceDue.present) {
      map['balance_due'] = Variable<double>(balanceDue.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (placeOfSupply.present) {
      map['place_of_supply'] = Variable<String>(placeOfSupply.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (ewayBillRequired.present) {
      map['eway_bill_required'] = Variable<bool>(ewayBillRequired.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('financialYearId: $financialYearId, ')
          ..write('customerId: $customerId, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('salesExecutive: $salesExecutive, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('taxableAmount: $taxableAmount, ')
          ..write('cgst: $cgst, ')
          ..write('sgst: $sgst, ')
          ..write('igst: $igst, ')
          ..write('roundOff: $roundOff, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('balanceDue: $balanceDue, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('placeOfSupply: $placeOfSupply, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('ewayBillRequired: $ewayBillRequired, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $InvoiceItemsTable extends InvoiceItems
    with TableInfo<$InvoiceItemsTable, InvoiceItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hsnMeta = const VerificationMeta('hsn');
  @override
  late final GeneratedColumn<String> hsn = GeneratedColumn<String>(
    'hsn',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _uomMeta = const VerificationMeta('uom');
  @override
  late final GeneratedColumn<String> uom = GeneratedColumn<String>(
    'uom',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PCS'),
  );
  static const VerificationMeta _unitRateMeta = const VerificationMeta(
    'unitRate',
  );
  @override
  late final GeneratedColumn<double> unitRate = GeneratedColumn<double>(
    'unit_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _discountPercentMeta = const VerificationMeta(
    'discountPercent',
  );
  @override
  late final GeneratedColumn<double> discountPercent = GeneratedColumn<double>(
    'discount_percent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _taxableValueMeta = const VerificationMeta(
    'taxableValue',
  );
  @override
  late final GeneratedColumn<double> taxableValue = GeneratedColumn<double>(
    'taxable_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _gstRateMeta = const VerificationMeta(
    'gstRate',
  );
  @override
  late final GeneratedColumn<double> gstRate = GeneratedColumn<double>(
    'gst_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _cgstMeta = const VerificationMeta('cgst');
  @override
  late final GeneratedColumn<double> cgst = GeneratedColumn<double>(
    'cgst',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sgstMeta = const VerificationMeta('sgst');
  @override
  late final GeneratedColumn<double> sgst = GeneratedColumn<double>(
    'sgst',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _igstMeta = const VerificationMeta('igst');
  @override
  late final GeneratedColumn<double> igst = GeneratedColumn<double>(
    'igst',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    productId,
    description,
    hsn,
    quantity,
    uom,
    unitRate,
    discountPercent,
    taxableValue,
    gstRate,
    cgst,
    sgst,
    igst,
    total,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('hsn')) {
      context.handle(
        _hsnMeta,
        hsn.isAcceptableOrUnknown(data['hsn']!, _hsnMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('uom')) {
      context.handle(
        _uomMeta,
        uom.isAcceptableOrUnknown(data['uom']!, _uomMeta),
      );
    }
    if (data.containsKey('unit_rate')) {
      context.handle(
        _unitRateMeta,
        unitRate.isAcceptableOrUnknown(data['unit_rate']!, _unitRateMeta),
      );
    }
    if (data.containsKey('discount_percent')) {
      context.handle(
        _discountPercentMeta,
        discountPercent.isAcceptableOrUnknown(
          data['discount_percent']!,
          _discountPercentMeta,
        ),
      );
    }
    if (data.containsKey('taxable_value')) {
      context.handle(
        _taxableValueMeta,
        taxableValue.isAcceptableOrUnknown(
          data['taxable_value']!,
          _taxableValueMeta,
        ),
      );
    }
    if (data.containsKey('gst_rate')) {
      context.handle(
        _gstRateMeta,
        gstRate.isAcceptableOrUnknown(data['gst_rate']!, _gstRateMeta),
      );
    }
    if (data.containsKey('cgst')) {
      context.handle(
        _cgstMeta,
        cgst.isAcceptableOrUnknown(data['cgst']!, _cgstMeta),
      );
    }
    if (data.containsKey('sgst')) {
      context.handle(
        _sgstMeta,
        sgst.isAcceptableOrUnknown(data['sgst']!, _sgstMeta),
      );
    }
    if (data.containsKey('igst')) {
      context.handle(
        _igstMeta,
        igst.isAcceptableOrUnknown(data['igst']!, _igstMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      hsn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hsn'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      uom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uom'],
      )!,
      unitRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_rate'],
      )!,
      discountPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_percent'],
      )!,
      taxableValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}taxable_value'],
      )!,
      gstRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gst_rate'],
      )!,
      cgst: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cgst'],
      )!,
      sgst: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sgst'],
      )!,
      igst: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}igst'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      )!,
    );
  }

  @override
  $InvoiceItemsTable createAlias(String alias) {
    return $InvoiceItemsTable(attachedDatabase, alias);
  }
}

class InvoiceItem extends DataClass implements Insertable<InvoiceItem> {
  final int id;
  final int invoiceId;
  final int productId;
  final String description;
  final String? hsn;
  final double quantity;
  final String uom;
  final double unitRate;
  final double discountPercent;
  final double taxableValue;
  final double gstRate;
  final double cgst;
  final double sgst;
  final double igst;
  final double total;
  const InvoiceItem({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.description,
    this.hsn,
    required this.quantity,
    required this.uom,
    required this.unitRate,
    required this.discountPercent,
    required this.taxableValue,
    required this.gstRate,
    required this.cgst,
    required this.sgst,
    required this.igst,
    required this.total,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['product_id'] = Variable<int>(productId);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || hsn != null) {
      map['hsn'] = Variable<String>(hsn);
    }
    map['quantity'] = Variable<double>(quantity);
    map['uom'] = Variable<String>(uom);
    map['unit_rate'] = Variable<double>(unitRate);
    map['discount_percent'] = Variable<double>(discountPercent);
    map['taxable_value'] = Variable<double>(taxableValue);
    map['gst_rate'] = Variable<double>(gstRate);
    map['cgst'] = Variable<double>(cgst);
    map['sgst'] = Variable<double>(sgst);
    map['igst'] = Variable<double>(igst);
    map['total'] = Variable<double>(total);
    return map;
  }

  InvoiceItemsCompanion toCompanion(bool nullToAbsent) {
    return InvoiceItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      productId: Value(productId),
      description: Value(description),
      hsn: hsn == null && nullToAbsent ? const Value.absent() : Value(hsn),
      quantity: Value(quantity),
      uom: Value(uom),
      unitRate: Value(unitRate),
      discountPercent: Value(discountPercent),
      taxableValue: Value(taxableValue),
      gstRate: Value(gstRate),
      cgst: Value(cgst),
      sgst: Value(sgst),
      igst: Value(igst),
      total: Value(total),
    );
  }

  factory InvoiceItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceItem(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      productId: serializer.fromJson<int>(json['productId']),
      description: serializer.fromJson<String>(json['description']),
      hsn: serializer.fromJson<String?>(json['hsn']),
      quantity: serializer.fromJson<double>(json['quantity']),
      uom: serializer.fromJson<String>(json['uom']),
      unitRate: serializer.fromJson<double>(json['unitRate']),
      discountPercent: serializer.fromJson<double>(json['discountPercent']),
      taxableValue: serializer.fromJson<double>(json['taxableValue']),
      gstRate: serializer.fromJson<double>(json['gstRate']),
      cgst: serializer.fromJson<double>(json['cgst']),
      sgst: serializer.fromJson<double>(json['sgst']),
      igst: serializer.fromJson<double>(json['igst']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'productId': serializer.toJson<int>(productId),
      'description': serializer.toJson<String>(description),
      'hsn': serializer.toJson<String?>(hsn),
      'quantity': serializer.toJson<double>(quantity),
      'uom': serializer.toJson<String>(uom),
      'unitRate': serializer.toJson<double>(unitRate),
      'discountPercent': serializer.toJson<double>(discountPercent),
      'taxableValue': serializer.toJson<double>(taxableValue),
      'gstRate': serializer.toJson<double>(gstRate),
      'cgst': serializer.toJson<double>(cgst),
      'sgst': serializer.toJson<double>(sgst),
      'igst': serializer.toJson<double>(igst),
      'total': serializer.toJson<double>(total),
    };
  }

  InvoiceItem copyWith({
    int? id,
    int? invoiceId,
    int? productId,
    String? description,
    Value<String?> hsn = const Value.absent(),
    double? quantity,
    String? uom,
    double? unitRate,
    double? discountPercent,
    double? taxableValue,
    double? gstRate,
    double? cgst,
    double? sgst,
    double? igst,
    double? total,
  }) => InvoiceItem(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    productId: productId ?? this.productId,
    description: description ?? this.description,
    hsn: hsn.present ? hsn.value : this.hsn,
    quantity: quantity ?? this.quantity,
    uom: uom ?? this.uom,
    unitRate: unitRate ?? this.unitRate,
    discountPercent: discountPercent ?? this.discountPercent,
    taxableValue: taxableValue ?? this.taxableValue,
    gstRate: gstRate ?? this.gstRate,
    cgst: cgst ?? this.cgst,
    sgst: sgst ?? this.sgst,
    igst: igst ?? this.igst,
    total: total ?? this.total,
  );
  InvoiceItem copyWithCompanion(InvoiceItemsCompanion data) {
    return InvoiceItem(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      productId: data.productId.present ? data.productId.value : this.productId,
      description: data.description.present
          ? data.description.value
          : this.description,
      hsn: data.hsn.present ? data.hsn.value : this.hsn,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      uom: data.uom.present ? data.uom.value : this.uom,
      unitRate: data.unitRate.present ? data.unitRate.value : this.unitRate,
      discountPercent: data.discountPercent.present
          ? data.discountPercent.value
          : this.discountPercent,
      taxableValue: data.taxableValue.present
          ? data.taxableValue.value
          : this.taxableValue,
      gstRate: data.gstRate.present ? data.gstRate.value : this.gstRate,
      cgst: data.cgst.present ? data.cgst.value : this.cgst,
      sgst: data.sgst.present ? data.sgst.value : this.sgst,
      igst: data.igst.present ? data.igst.value : this.igst,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItem(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('description: $description, ')
          ..write('hsn: $hsn, ')
          ..write('quantity: $quantity, ')
          ..write('uom: $uom, ')
          ..write('unitRate: $unitRate, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('taxableValue: $taxableValue, ')
          ..write('gstRate: $gstRate, ')
          ..write('cgst: $cgst, ')
          ..write('sgst: $sgst, ')
          ..write('igst: $igst, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceId,
    productId,
    description,
    hsn,
    quantity,
    uom,
    unitRate,
    discountPercent,
    taxableValue,
    gstRate,
    cgst,
    sgst,
    igst,
    total,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceItem &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.productId == this.productId &&
          other.description == this.description &&
          other.hsn == this.hsn &&
          other.quantity == this.quantity &&
          other.uom == this.uom &&
          other.unitRate == this.unitRate &&
          other.discountPercent == this.discountPercent &&
          other.taxableValue == this.taxableValue &&
          other.gstRate == this.gstRate &&
          other.cgst == this.cgst &&
          other.sgst == this.sgst &&
          other.igst == this.igst &&
          other.total == this.total);
}

class InvoiceItemsCompanion extends UpdateCompanion<InvoiceItem> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<int> productId;
  final Value<String> description;
  final Value<String?> hsn;
  final Value<double> quantity;
  final Value<String> uom;
  final Value<double> unitRate;
  final Value<double> discountPercent;
  final Value<double> taxableValue;
  final Value<double> gstRate;
  final Value<double> cgst;
  final Value<double> sgst;
  final Value<double> igst;
  final Value<double> total;
  const InvoiceItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.description = const Value.absent(),
    this.hsn = const Value.absent(),
    this.quantity = const Value.absent(),
    this.uom = const Value.absent(),
    this.unitRate = const Value.absent(),
    this.discountPercent = const Value.absent(),
    this.taxableValue = const Value.absent(),
    this.gstRate = const Value.absent(),
    this.cgst = const Value.absent(),
    this.sgst = const Value.absent(),
    this.igst = const Value.absent(),
    this.total = const Value.absent(),
  });
  InvoiceItemsCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    required int productId,
    required String description,
    this.hsn = const Value.absent(),
    this.quantity = const Value.absent(),
    this.uom = const Value.absent(),
    this.unitRate = const Value.absent(),
    this.discountPercent = const Value.absent(),
    this.taxableValue = const Value.absent(),
    this.gstRate = const Value.absent(),
    this.cgst = const Value.absent(),
    this.sgst = const Value.absent(),
    this.igst = const Value.absent(),
    this.total = const Value.absent(),
  }) : invoiceId = Value(invoiceId),
       productId = Value(productId),
       description = Value(description);
  static Insertable<InvoiceItem> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<int>? productId,
    Expression<String>? description,
    Expression<String>? hsn,
    Expression<double>? quantity,
    Expression<String>? uom,
    Expression<double>? unitRate,
    Expression<double>? discountPercent,
    Expression<double>? taxableValue,
    Expression<double>? gstRate,
    Expression<double>? cgst,
    Expression<double>? sgst,
    Expression<double>? igst,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productId != null) 'product_id': productId,
      if (description != null) 'description': description,
      if (hsn != null) 'hsn': hsn,
      if (quantity != null) 'quantity': quantity,
      if (uom != null) 'uom': uom,
      if (unitRate != null) 'unit_rate': unitRate,
      if (discountPercent != null) 'discount_percent': discountPercent,
      if (taxableValue != null) 'taxable_value': taxableValue,
      if (gstRate != null) 'gst_rate': gstRate,
      if (cgst != null) 'cgst': cgst,
      if (sgst != null) 'sgst': sgst,
      if (igst != null) 'igst': igst,
      if (total != null) 'total': total,
    });
  }

  InvoiceItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? invoiceId,
    Value<int>? productId,
    Value<String>? description,
    Value<String?>? hsn,
    Value<double>? quantity,
    Value<String>? uom,
    Value<double>? unitRate,
    Value<double>? discountPercent,
    Value<double>? taxableValue,
    Value<double>? gstRate,
    Value<double>? cgst,
    Value<double>? sgst,
    Value<double>? igst,
    Value<double>? total,
  }) {
    return InvoiceItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      productId: productId ?? this.productId,
      description: description ?? this.description,
      hsn: hsn ?? this.hsn,
      quantity: quantity ?? this.quantity,
      uom: uom ?? this.uom,
      unitRate: unitRate ?? this.unitRate,
      discountPercent: discountPercent ?? this.discountPercent,
      taxableValue: taxableValue ?? this.taxableValue,
      gstRate: gstRate ?? this.gstRate,
      cgst: cgst ?? this.cgst,
      sgst: sgst ?? this.sgst,
      igst: igst ?? this.igst,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (hsn.present) {
      map['hsn'] = Variable<String>(hsn.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (uom.present) {
      map['uom'] = Variable<String>(uom.value);
    }
    if (unitRate.present) {
      map['unit_rate'] = Variable<double>(unitRate.value);
    }
    if (discountPercent.present) {
      map['discount_percent'] = Variable<double>(discountPercent.value);
    }
    if (taxableValue.present) {
      map['taxable_value'] = Variable<double>(taxableValue.value);
    }
    if (gstRate.present) {
      map['gst_rate'] = Variable<double>(gstRate.value);
    }
    if (cgst.present) {
      map['cgst'] = Variable<double>(cgst.value);
    }
    if (sgst.present) {
      map['sgst'] = Variable<double>(sgst.value);
    }
    if (igst.present) {
      map['igst'] = Variable<double>(igst.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('description: $description, ')
          ..write('hsn: $hsn, ')
          ..write('quantity: $quantity, ')
          ..write('uom: $uom, ')
          ..write('unitRate: $unitRate, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('taxableValue: $taxableValue, ')
          ..write('gstRate: $gstRate, ')
          ..write('cgst: $cgst, ')
          ..write('sgst: $sgst, ')
          ..write('igst: $igst, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customers (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentModeMeta = const VerificationMeta(
    'paymentMode',
  );
  @override
  late final GeneratedColumn<String> paymentMode = GeneratedColumn<String>(
    'payment_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _paymentDateMeta = const VerificationMeta(
    'paymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
    'payment_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _referenceNumberMeta = const VerificationMeta(
    'referenceNumber',
  );
  @override
  late final GeneratedColumn<String> referenceNumber = GeneratedColumn<String>(
    'reference_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarksMeta = const VerificationMeta(
    'remarks',
  );
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
    'remarks',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerId,
    amount,
    paymentMode,
    paymentDate,
    referenceNumber,
    remarks,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_mode')) {
      context.handle(
        _paymentModeMeta,
        paymentMode.isAcceptableOrUnknown(
          data['payment_mode']!,
          _paymentModeMeta,
        ),
      );
    }
    if (data.containsKey('payment_date')) {
      context.handle(
        _paymentDateMeta,
        paymentDate.isAcceptableOrUnknown(
          data['payment_date']!,
          _paymentDateMeta,
        ),
      );
    }
    if (data.containsKey('reference_number')) {
      context.handle(
        _referenceNumberMeta,
        referenceNumber.isAcceptableOrUnknown(
          data['reference_number']!,
          _referenceNumberMeta,
        ),
      );
    }
    if (data.containsKey('remarks')) {
      context.handle(
        _remarksMeta,
        remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      paymentMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_mode'],
      )!,
      paymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}payment_date'],
      )!,
      referenceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_number'],
      ),
      remarks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remarks'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final int id;
  final int customerId;
  final double amount;
  final String paymentMode;
  final DateTime paymentDate;
  final String? referenceNumber;
  final String? remarks;
  final DateTime createdAt;
  const Payment({
    required this.id,
    required this.customerId,
    required this.amount,
    required this.paymentMode,
    required this.paymentDate,
    this.referenceNumber,
    this.remarks,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['amount'] = Variable<double>(amount);
    map['payment_mode'] = Variable<String>(paymentMode);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    if (!nullToAbsent || referenceNumber != null) {
      map['reference_number'] = Variable<String>(referenceNumber);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      customerId: Value(customerId),
      amount: Value(amount),
      paymentMode: Value(paymentMode),
      paymentDate: Value(paymentDate),
      referenceNumber: referenceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceNumber),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
      createdAt: Value(createdAt),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentMode: serializer.fromJson<String>(json['paymentMode']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      referenceNumber: serializer.fromJson<String?>(json['referenceNumber']),
      remarks: serializer.fromJson<String?>(json['remarks']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'amount': serializer.toJson<double>(amount),
      'paymentMode': serializer.toJson<String>(paymentMode),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'referenceNumber': serializer.toJson<String?>(referenceNumber),
      'remarks': serializer.toJson<String?>(remarks),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Payment copyWith({
    int? id,
    int? customerId,
    double? amount,
    String? paymentMode,
    DateTime? paymentDate,
    Value<String?> referenceNumber = const Value.absent(),
    Value<String?> remarks = const Value.absent(),
    DateTime? createdAt,
  }) => Payment(
    id: id ?? this.id,
    customerId: customerId ?? this.customerId,
    amount: amount ?? this.amount,
    paymentMode: paymentMode ?? this.paymentMode,
    paymentDate: paymentDate ?? this.paymentDate,
    referenceNumber: referenceNumber.present
        ? referenceNumber.value
        : this.referenceNumber,
    remarks: remarks.present ? remarks.value : this.remarks,
    createdAt: createdAt ?? this.createdAt,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentMode: data.paymentMode.present
          ? data.paymentMode.value
          : this.paymentMode,
      paymentDate: data.paymentDate.present
          ? data.paymentDate.value
          : this.paymentDate,
      referenceNumber: data.referenceNumber.present
          ? data.referenceNumber.value
          : this.referenceNumber,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('amount: $amount, ')
          ..write('paymentMode: $paymentMode, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('remarks: $remarks, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    customerId,
    amount,
    paymentMode,
    paymentDate,
    referenceNumber,
    remarks,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.amount == this.amount &&
          other.paymentMode == this.paymentMode &&
          other.paymentDate == this.paymentDate &&
          other.referenceNumber == this.referenceNumber &&
          other.remarks == this.remarks &&
          other.createdAt == this.createdAt);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<int> id;
  final Value<int> customerId;
  final Value<double> amount;
  final Value<String> paymentMode;
  final Value<DateTime> paymentDate;
  final Value<String?> referenceNumber;
  final Value<String?> remarks;
  final Value<DateTime> createdAt;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentMode = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.remarks = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int customerId,
    required double amount,
    this.paymentMode = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.remarks = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : customerId = Value(customerId),
       amount = Value(amount);
  static Insertable<Payment> custom({
    Expression<int>? id,
    Expression<int>? customerId,
    Expression<double>? amount,
    Expression<String>? paymentMode,
    Expression<DateTime>? paymentDate,
    Expression<String>? referenceNumber,
    Expression<String>? remarks,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (amount != null) 'amount': amount,
      if (paymentMode != null) 'payment_mode': paymentMode,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (referenceNumber != null) 'reference_number': referenceNumber,
      if (remarks != null) 'remarks': remarks,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PaymentsCompanion copyWith({
    Value<int>? id,
    Value<int>? customerId,
    Value<double>? amount,
    Value<String>? paymentMode,
    Value<DateTime>? paymentDate,
    Value<String?>? referenceNumber,
    Value<String?>? remarks,
    Value<DateTime>? createdAt,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      amount: amount ?? this.amount,
      paymentMode: paymentMode ?? this.paymentMode,
      paymentDate: paymentDate ?? this.paymentDate,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      remarks: remarks ?? this.remarks,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentMode.present) {
      map['payment_mode'] = Variable<String>(paymentMode.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (referenceNumber.present) {
      map['reference_number'] = Variable<String>(referenceNumber.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('amount: $amount, ')
          ..write('paymentMode: $paymentMode, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('remarks: $remarks, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CompaniesTable companies = $CompaniesTable(this);
  late final $FinancialYearsTable financialYears = $FinancialYearsTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $InvoiceItemsTable invoiceItems = $InvoiceItemsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    companies,
    financialYears,
    customers,
    products,
    invoices,
    invoiceItems,
    payments,
  ];
}

typedef $$CompaniesTableCreateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int> id,
      required String companyName,
      Value<String?> legalName,
      Value<String?> gstin,
      Value<String?> pan,
      Value<String?> cin,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> registeredAddress,
      Value<String?> corporateAddress,
      Value<String?> state,
      Value<String?> stateCode,
      Value<String?> bankName,
      Value<String?> accountNumber,
      Value<String?> ifsc,
      Value<String?> branch,
      Value<String?> logoPath,
    });
typedef $$CompaniesTableUpdateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int> id,
      Value<String> companyName,
      Value<String?> legalName,
      Value<String?> gstin,
      Value<String?> pan,
      Value<String?> cin,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> registeredAddress,
      Value<String?> corporateAddress,
      Value<String?> state,
      Value<String?> stateCode,
      Value<String?> bankName,
      Value<String?> accountNumber,
      Value<String?> ifsc,
      Value<String?> branch,
      Value<String?> logoPath,
    });

class $$CompaniesTableFilterComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get legalName => $composableBuilder(
    column: $table.legalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gstin => $composableBuilder(
    column: $table.gstin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pan => $composableBuilder(
    column: $table.pan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cin => $composableBuilder(
    column: $table.cin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registeredAddress => $composableBuilder(
    column: $table.registeredAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corporateAddress => $composableBuilder(
    column: $table.corporateAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateCode => $composableBuilder(
    column: $table.stateCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ifsc => $composableBuilder(
    column: $table.ifsc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get branch => $composableBuilder(
    column: $table.branch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CompaniesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get legalName => $composableBuilder(
    column: $table.legalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gstin => $composableBuilder(
    column: $table.gstin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pan => $composableBuilder(
    column: $table.pan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cin => $composableBuilder(
    column: $table.cin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registeredAddress => $composableBuilder(
    column: $table.registeredAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corporateAddress => $composableBuilder(
    column: $table.corporateAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateCode => $composableBuilder(
    column: $table.stateCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ifsc => $composableBuilder(
    column: $table.ifsc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get branch => $composableBuilder(
    column: $table.branch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CompaniesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get legalName =>
      $composableBuilder(column: $table.legalName, builder: (column) => column);

  GeneratedColumn<String> get gstin =>
      $composableBuilder(column: $table.gstin, builder: (column) => column);

  GeneratedColumn<String> get pan =>
      $composableBuilder(column: $table.pan, builder: (column) => column);

  GeneratedColumn<String> get cin =>
      $composableBuilder(column: $table.cin, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get registeredAddress => $composableBuilder(
    column: $table.registeredAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get corporateAddress => $composableBuilder(
    column: $table.corporateAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get stateCode =>
      $composableBuilder(column: $table.stateCode, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ifsc =>
      $composableBuilder(column: $table.ifsc, builder: (column) => column);

  GeneratedColumn<String> get branch =>
      $composableBuilder(column: $table.branch, builder: (column) => column);

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);
}

class $$CompaniesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompaniesTable,
          Company,
          $$CompaniesTableFilterComposer,
          $$CompaniesTableOrderingComposer,
          $$CompaniesTableAnnotationComposer,
          $$CompaniesTableCreateCompanionBuilder,
          $$CompaniesTableUpdateCompanionBuilder,
          (Company, BaseReferences<_$AppDatabase, $CompaniesTable, Company>),
          Company,
          PrefetchHooks Function()
        > {
  $$CompaniesTableTableManager(_$AppDatabase db, $CompaniesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompaniesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompaniesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompaniesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> companyName = const Value.absent(),
                Value<String?> legalName = const Value.absent(),
                Value<String?> gstin = const Value.absent(),
                Value<String?> pan = const Value.absent(),
                Value<String?> cin = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> registeredAddress = const Value.absent(),
                Value<String?> corporateAddress = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> stateCode = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> accountNumber = const Value.absent(),
                Value<String?> ifsc = const Value.absent(),
                Value<String?> branch = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
              }) => CompaniesCompanion(
                id: id,
                companyName: companyName,
                legalName: legalName,
                gstin: gstin,
                pan: pan,
                cin: cin,
                phone: phone,
                email: email,
                registeredAddress: registeredAddress,
                corporateAddress: corporateAddress,
                state: state,
                stateCode: stateCode,
                bankName: bankName,
                accountNumber: accountNumber,
                ifsc: ifsc,
                branch: branch,
                logoPath: logoPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String companyName,
                Value<String?> legalName = const Value.absent(),
                Value<String?> gstin = const Value.absent(),
                Value<String?> pan = const Value.absent(),
                Value<String?> cin = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> registeredAddress = const Value.absent(),
                Value<String?> corporateAddress = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> stateCode = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> accountNumber = const Value.absent(),
                Value<String?> ifsc = const Value.absent(),
                Value<String?> branch = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
              }) => CompaniesCompanion.insert(
                id: id,
                companyName: companyName,
                legalName: legalName,
                gstin: gstin,
                pan: pan,
                cin: cin,
                phone: phone,
                email: email,
                registeredAddress: registeredAddress,
                corporateAddress: corporateAddress,
                state: state,
                stateCode: stateCode,
                bankName: bankName,
                accountNumber: accountNumber,
                ifsc: ifsc,
                branch: branch,
                logoPath: logoPath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CompaniesTable, Company>(table),
                  BaseReferences<_$AppDatabase, $CompaniesTable, Company>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CompaniesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompaniesTable,
      Company,
      $$CompaniesTableFilterComposer,
      $$CompaniesTableOrderingComposer,
      $$CompaniesTableAnnotationComposer,
      $$CompaniesTableCreateCompanionBuilder,
      $$CompaniesTableUpdateCompanionBuilder,
      (Company, BaseReferences<_$AppDatabase, $CompaniesTable, Company>),
      Company,
      PrefetchHooks Function()
    >;
typedef $$FinancialYearsTableCreateCompanionBuilder =
    FinancialYearsCompanion Function({
      Value<int> id,
      required String name,
      required DateTime startDate,
      required DateTime endDate,
      Value<bool> isActive,
      Value<bool> isLocked,
    });
typedef $$FinancialYearsTableUpdateCompanionBuilder =
    FinancialYearsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<bool> isActive,
      Value<bool> isLocked,
    });

final class $$FinancialYearsTableReferences
    extends BaseReferences<_$AppDatabase, $FinancialYearsTable, FinancialYear> {
  $$FinancialYearsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: 'financial_years__id__invoices__financial_year_id',
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.financialYearId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FinancialYearsTableFilterComposer
    extends Composer<_$AppDatabase, $FinancialYearsTable> {
  $$FinancialYearsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.financialYearId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FinancialYearsTableOrderingComposer
    extends Composer<_$AppDatabase, $FinancialYearsTable> {
  $$FinancialYearsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FinancialYearsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FinancialYearsTable> {
  $$FinancialYearsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isLocked =>
      $composableBuilder(column: $table.isLocked, builder: (column) => column);

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.financialYearId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FinancialYearsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FinancialYearsTable,
          FinancialYear,
          $$FinancialYearsTableFilterComposer,
          $$FinancialYearsTableOrderingComposer,
          $$FinancialYearsTableAnnotationComposer,
          $$FinancialYearsTableCreateCompanionBuilder,
          $$FinancialYearsTableUpdateCompanionBuilder,
          (FinancialYear, $$FinancialYearsTableReferences),
          FinancialYear,
          PrefetchHooks Function({bool invoicesRefs})
        > {
  $$FinancialYearsTableTableManager(
    _$AppDatabase db,
    $FinancialYearsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FinancialYearsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FinancialYearsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FinancialYearsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
              }) => FinancialYearsCompanion(
                id: id,
                name: name,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                isLocked: isLocked,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required DateTime startDate,
                required DateTime endDate,
                Value<bool> isActive = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
              }) => FinancialYearsCompanion.insert(
                id: id,
                name: name,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                isLocked: isLocked,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FinancialYearsTable, FinancialYear>(table),
                  $$FinancialYearsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoicesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (invoicesRefs) db.invoices],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoicesRefs)
                    await $_getPrefetchedData<
                      FinancialYear,
                      $FinancialYearsTable,
                      Invoice
                    >(
                      currentTable: table,
                      referencedTable: $$FinancialYearsTableReferences
                          ._invoicesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FinancialYearsTableReferences(
                            db,
                            table,
                            p0,
                          ).invoicesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.financialYearId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FinancialYearsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FinancialYearsTable,
      FinancialYear,
      $$FinancialYearsTableFilterComposer,
      $$FinancialYearsTableOrderingComposer,
      $$FinancialYearsTableAnnotationComposer,
      $$FinancialYearsTableCreateCompanionBuilder,
      $$FinancialYearsTableUpdateCompanionBuilder,
      (FinancialYear, $$FinancialYearsTableReferences),
      FinancialYear,
      PrefetchHooks Function({bool invoicesRefs})
    >;
typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      required String customerCode,
      required String tradeName,
      Value<String?> legalName,
      Value<String?> gstin,
      Value<String?> pan,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> contactPerson,
      Value<String?> billingAddress,
      Value<String?> shippingAddress,
      Value<String?> city,
      Value<String?> state,
      Value<String?> stateCode,
      Value<double> openingBalance,
      Value<String> openingBalanceType,
      Value<double> creditLimit,
      Value<int> creditDays,
      Value<String?> priceTier,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      Value<String> customerCode,
      Value<String> tradeName,
      Value<String?> legalName,
      Value<String?> gstin,
      Value<String?> pan,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> contactPerson,
      Value<String?> billingAddress,
      Value<String?> shippingAddress,
      Value<String?> city,
      Value<String?> state,
      Value<String?> stateCode,
      Value<double> openingBalance,
      Value<String> openingBalanceType,
      Value<double> creditLimit,
      Value<int> creditDays,
      Value<String?> priceTier,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$CustomersTableReferences
    extends BaseReferences<_$AppDatabase, $CustomersTable, Customer> {
  $$CustomersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: 'customers__id__invoices__customer_id',
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: 'customers__id__payments__customer_id',
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerCode => $composableBuilder(
    column: $table.customerCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tradeName => $composableBuilder(
    column: $table.tradeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get legalName => $composableBuilder(
    column: $table.legalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gstin => $composableBuilder(
    column: $table.gstin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pan => $composableBuilder(
    column: $table.pan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactPerson => $composableBuilder(
    column: $table.contactPerson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shippingAddress => $composableBuilder(
    column: $table.shippingAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateCode => $composableBuilder(
    column: $table.stateCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get openingBalanceType => $composableBuilder(
    column: $table.openingBalanceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creditDays => $composableBuilder(
    column: $table.creditDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priceTier => $composableBuilder(
    column: $table.priceTier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerCode => $composableBuilder(
    column: $table.customerCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tradeName => $composableBuilder(
    column: $table.tradeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get legalName => $composableBuilder(
    column: $table.legalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gstin => $composableBuilder(
    column: $table.gstin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pan => $composableBuilder(
    column: $table.pan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactPerson => $composableBuilder(
    column: $table.contactPerson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shippingAddress => $composableBuilder(
    column: $table.shippingAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateCode => $composableBuilder(
    column: $table.stateCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get openingBalanceType => $composableBuilder(
    column: $table.openingBalanceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creditDays => $composableBuilder(
    column: $table.creditDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priceTier => $composableBuilder(
    column: $table.priceTier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerCode => $composableBuilder(
    column: $table.customerCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tradeName =>
      $composableBuilder(column: $table.tradeName, builder: (column) => column);

  GeneratedColumn<String> get legalName =>
      $composableBuilder(column: $table.legalName, builder: (column) => column);

  GeneratedColumn<String> get gstin =>
      $composableBuilder(column: $table.gstin, builder: (column) => column);

  GeneratedColumn<String> get pan =>
      $composableBuilder(column: $table.pan, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get contactPerson => $composableBuilder(
    column: $table.contactPerson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shippingAddress => $composableBuilder(
    column: $table.shippingAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get stateCode =>
      $composableBuilder(column: $table.stateCode, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<String> get openingBalanceType => $composableBuilder(
    column: $table.openingBalanceType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get creditDays => $composableBuilder(
    column: $table.creditDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priceTier =>
      $composableBuilder(column: $table.priceTier, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, $$CustomersTableReferences),
          Customer,
          PrefetchHooks Function({bool invoicesRefs, bool paymentsRefs})
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> customerCode = const Value.absent(),
                Value<String> tradeName = const Value.absent(),
                Value<String?> legalName = const Value.absent(),
                Value<String?> gstin = const Value.absent(),
                Value<String?> pan = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> contactPerson = const Value.absent(),
                Value<String?> billingAddress = const Value.absent(),
                Value<String?> shippingAddress = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> stateCode = const Value.absent(),
                Value<double> openingBalance = const Value.absent(),
                Value<String> openingBalanceType = const Value.absent(),
                Value<double> creditLimit = const Value.absent(),
                Value<int> creditDays = const Value.absent(),
                Value<String?> priceTier = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                customerCode: customerCode,
                tradeName: tradeName,
                legalName: legalName,
                gstin: gstin,
                pan: pan,
                phone: phone,
                email: email,
                contactPerson: contactPerson,
                billingAddress: billingAddress,
                shippingAddress: shippingAddress,
                city: city,
                state: state,
                stateCode: stateCode,
                openingBalance: openingBalance,
                openingBalanceType: openingBalanceType,
                creditLimit: creditLimit,
                creditDays: creditDays,
                priceTier: priceTier,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String customerCode,
                required String tradeName,
                Value<String?> legalName = const Value.absent(),
                Value<String?> gstin = const Value.absent(),
                Value<String?> pan = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> contactPerson = const Value.absent(),
                Value<String?> billingAddress = const Value.absent(),
                Value<String?> shippingAddress = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> stateCode = const Value.absent(),
                Value<double> openingBalance = const Value.absent(),
                Value<String> openingBalanceType = const Value.absent(),
                Value<double> creditLimit = const Value.absent(),
                Value<int> creditDays = const Value.absent(),
                Value<String?> priceTier = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                customerCode: customerCode,
                tradeName: tradeName,
                legalName: legalName,
                gstin: gstin,
                pan: pan,
                phone: phone,
                email: email,
                contactPerson: contactPerson,
                billingAddress: billingAddress,
                shippingAddress: shippingAddress,
                city: city,
                state: state,
                stateCode: stateCode,
                openingBalance: openingBalance,
                openingBalanceType: openingBalanceType,
                creditLimit: creditLimit,
                creditDays: creditDays,
                priceTier: priceTier,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CustomersTable, Customer>(table),
                  $$CustomersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({invoicesRefs = false, paymentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoicesRefs) db.invoices,
                    if (paymentsRefs) db.payments,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoicesRefs)
                        await $_getPrefetchedData<
                          Customer,
                          $CustomersTable,
                          Invoice
                        >(
                          currentTable: table,
                          referencedTable: $$CustomersTableReferences
                              ._invoicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomersTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.customerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          Customer,
                          $CustomersTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$CustomersTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomersTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.customerId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, $$CustomersTableReferences),
      Customer,
      PrefetchHooks Function({bool invoicesRefs, bool paymentsRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required String sku,
      Value<String?> barcode,
      required String productName,
      Value<String?> description,
      Value<String?> hsn,
      Value<String?> sac,
      Value<String> uom,
      Value<double> purchaseRate,
      Value<double> sellingRate,
      Value<double> wholesaleRate,
      Value<double> gstRate,
      Value<double> openingStock,
      Value<double> currentStock,
      Value<double> minimumStock,
      Value<String> status,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String> sku,
      Value<String?> barcode,
      Value<String> productName,
      Value<String?> description,
      Value<String?> hsn,
      Value<String?> sac,
      Value<String> uom,
      Value<double> purchaseRate,
      Value<double> sellingRate,
      Value<double> wholesaleRate,
      Value<double> gstRate,
      Value<double> openingStock,
      Value<double> currentStock,
      Value<double> minimumStock,
      Value<String> status,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InvoiceItemsTable, List<InvoiceItem>>
  _invoiceItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.invoiceItems,
    aliasName: 'products__id__invoice_items__product_id',
  );

  $$InvoiceItemsTableProcessedTableManager get invoiceItemsRefs {
    final manager = $$InvoiceItemsTableTableManager(
      $_db,
      $_db.invoiceItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hsn => $composableBuilder(
    column: $table.hsn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sac => $composableBuilder(
    column: $table.sac,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uom => $composableBuilder(
    column: $table.uom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purchaseRate => $composableBuilder(
    column: $table.purchaseRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sellingRate => $composableBuilder(
    column: $table.sellingRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get wholesaleRate => $composableBuilder(
    column: $table.wholesaleRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gstRate => $composableBuilder(
    column: $table.gstRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get openingStock => $composableBuilder(
    column: $table.openingStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minimumStock => $composableBuilder(
    column: $table.minimumStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> invoiceItemsRefs(
    Expression<bool> Function($$InvoiceItemsTableFilterComposer f) f,
  ) {
    final $$InvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hsn => $composableBuilder(
    column: $table.hsn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sac => $composableBuilder(
    column: $table.sac,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uom => $composableBuilder(
    column: $table.uom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purchaseRate => $composableBuilder(
    column: $table.purchaseRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sellingRate => $composableBuilder(
    column: $table.sellingRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get wholesaleRate => $composableBuilder(
    column: $table.wholesaleRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gstRate => $composableBuilder(
    column: $table.gstRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get openingStock => $composableBuilder(
    column: $table.openingStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minimumStock => $composableBuilder(
    column: $table.minimumStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hsn =>
      $composableBuilder(column: $table.hsn, builder: (column) => column);

  GeneratedColumn<String> get sac =>
      $composableBuilder(column: $table.sac, builder: (column) => column);

  GeneratedColumn<String> get uom =>
      $composableBuilder(column: $table.uom, builder: (column) => column);

  GeneratedColumn<double> get purchaseRate => $composableBuilder(
    column: $table.purchaseRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sellingRate => $composableBuilder(
    column: $table.sellingRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get wholesaleRate => $composableBuilder(
    column: $table.wholesaleRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get gstRate =>
      $composableBuilder(column: $table.gstRate, builder: (column) => column);

  GeneratedColumn<double> get openingStock => $composableBuilder(
    column: $table.openingStock,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => column,
  );

  GeneratedColumn<double> get minimumStock => $composableBuilder(
    column: $table.minimumStock,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  Expression<T> invoiceItemsRefs<T extends Object>(
    Expression<T> Function($$InvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$InvoiceItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({bool invoiceItemsRefs})
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> hsn = const Value.absent(),
                Value<String?> sac = const Value.absent(),
                Value<String> uom = const Value.absent(),
                Value<double> purchaseRate = const Value.absent(),
                Value<double> sellingRate = const Value.absent(),
                Value<double> wholesaleRate = const Value.absent(),
                Value<double> gstRate = const Value.absent(),
                Value<double> openingStock = const Value.absent(),
                Value<double> currentStock = const Value.absent(),
                Value<double> minimumStock = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                sku: sku,
                barcode: barcode,
                productName: productName,
                description: description,
                hsn: hsn,
                sac: sac,
                uom: uom,
                purchaseRate: purchaseRate,
                sellingRate: sellingRate,
                wholesaleRate: wholesaleRate,
                gstRate: gstRate,
                openingStock: openingStock,
                currentStock: currentStock,
                minimumStock: minimumStock,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sku,
                Value<String?> barcode = const Value.absent(),
                required String productName,
                Value<String?> description = const Value.absent(),
                Value<String?> hsn = const Value.absent(),
                Value<String?> sac = const Value.absent(),
                Value<String> uom = const Value.absent(),
                Value<double> purchaseRate = const Value.absent(),
                Value<double> sellingRate = const Value.absent(),
                Value<double> wholesaleRate = const Value.absent(),
                Value<double> gstRate = const Value.absent(),
                Value<double> openingStock = const Value.absent(),
                Value<double> currentStock = const Value.absent(),
                Value<double> minimumStock = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                sku: sku,
                barcode: barcode,
                productName: productName,
                description: description,
                hsn: hsn,
                sac: sac,
                uom: uom,
                purchaseRate: purchaseRate,
                sellingRate: sellingRate,
                wholesaleRate: wholesaleRate,
                gstRate: gstRate,
                openingStock: openingStock,
                currentStock: currentStock,
                minimumStock: minimumStock,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductsTable, Product>(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoiceItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (invoiceItemsRefs) db.invoiceItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoiceItemsRefs)
                    await $_getPrefetchedData<
                      Product,
                      $ProductsTable,
                      InvoiceItem
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._invoiceItemsRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProductsTableReferences(
                        db,
                        table,
                        p0,
                      ).invoiceItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({bool invoiceItemsRefs})
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      required String invoiceNumber,
      required int financialYearId,
      required int customerId,
      required DateTime invoiceDate,
      required DateTime dueDate,
      Value<String?> salesExecutive,
      Value<double> subtotal,
      Value<double> discount,
      Value<double> taxableAmount,
      Value<double> cgst,
      Value<double> sgst,
      Value<double> igst,
      Value<double> roundOff,
      Value<double> grandTotal,
      Value<double> amountReceived,
      Value<double> balanceDue,
      Value<String> paymentStatus,
      Value<String?> placeOfSupply,
      Value<String?> paymentMethod,
      Value<bool> ewayBillRequired,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      Value<String> invoiceNumber,
      Value<int> financialYearId,
      Value<int> customerId,
      Value<DateTime> invoiceDate,
      Value<DateTime> dueDate,
      Value<String?> salesExecutive,
      Value<double> subtotal,
      Value<double> discount,
      Value<double> taxableAmount,
      Value<double> cgst,
      Value<double> sgst,
      Value<double> igst,
      Value<double> roundOff,
      Value<double> grandTotal,
      Value<double> amountReceived,
      Value<double> balanceDue,
      Value<String> paymentStatus,
      Value<String?> placeOfSupply,
      Value<String?> paymentMethod,
      Value<bool> ewayBillRequired,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

final class $$InvoicesTableReferences
    extends BaseReferences<_$AppDatabase, $InvoicesTable, Invoice> {
  $$InvoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FinancialYearsTable _financialYearIdTable(_$AppDatabase db) => db
      .financialYears
      .createAlias('invoices__financial_year_id__financial_years__id');

  $$FinancialYearsTableProcessedTableManager get financialYearId {
    final $_column = $_itemColumn<int>('financial_year_id')!;

    final manager = $$FinancialYearsTableTableManager(
      $_db,
      $_db.financialYears,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_financialYearIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias('invoices__customer_id__customers__id');

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoiceItemsTable, List<InvoiceItem>>
  _invoiceItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.invoiceItems,
    aliasName: 'invoices__id__invoice_items__invoice_id',
  );

  $$InvoiceItemsTableProcessedTableManager get invoiceItemsRefs {
    final manager = $$InvoiceItemsTableTableManager(
      $_db,
      $_db.invoiceItems,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get salesExecutive => $composableBuilder(
    column: $table.salesExecutive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxableAmount => $composableBuilder(
    column: $table.taxableAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cgst => $composableBuilder(
    column: $table.cgst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sgst => $composableBuilder(
    column: $table.sgst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get igst => $composableBuilder(
    column: $table.igst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get roundOff => $composableBuilder(
    column: $table.roundOff,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountReceived => $composableBuilder(
    column: $table.amountReceived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balanceDue => $composableBuilder(
    column: $table.balanceDue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeOfSupply => $composableBuilder(
    column: $table.placeOfSupply,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get ewayBillRequired => $composableBuilder(
    column: $table.ewayBillRequired,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FinancialYearsTableFilterComposer get financialYearId {
    final $$FinancialYearsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.financialYearId,
      referencedTable: $db.financialYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FinancialYearsTableFilterComposer(
            $db: $db,
            $table: $db.financialYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoiceItemsRefs(
    Expression<bool> Function($$InvoiceItemsTableFilterComposer f) f,
  ) {
    final $$InvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get salesExecutive => $composableBuilder(
    column: $table.salesExecutive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxableAmount => $composableBuilder(
    column: $table.taxableAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cgst => $composableBuilder(
    column: $table.cgst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sgst => $composableBuilder(
    column: $table.sgst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get igst => $composableBuilder(
    column: $table.igst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get roundOff => $composableBuilder(
    column: $table.roundOff,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountReceived => $composableBuilder(
    column: $table.amountReceived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balanceDue => $composableBuilder(
    column: $table.balanceDue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeOfSupply => $composableBuilder(
    column: $table.placeOfSupply,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ewayBillRequired => $composableBuilder(
    column: $table.ewayBillRequired,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FinancialYearsTableOrderingComposer get financialYearId {
    final $$FinancialYearsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.financialYearId,
      referencedTable: $db.financialYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FinancialYearsTableOrderingComposer(
            $db: $db,
            $table: $db.financialYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableOrderingComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get salesExecutive => $composableBuilder(
    column: $table.salesExecutive,
    builder: (column) => column,
  );

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get taxableAmount => $composableBuilder(
    column: $table.taxableAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cgst =>
      $composableBuilder(column: $table.cgst, builder: (column) => column);

  GeneratedColumn<double> get sgst =>
      $composableBuilder(column: $table.sgst, builder: (column) => column);

  GeneratedColumn<double> get igst =>
      $composableBuilder(column: $table.igst, builder: (column) => column);

  GeneratedColumn<double> get roundOff =>
      $composableBuilder(column: $table.roundOff, builder: (column) => column);

  GeneratedColumn<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amountReceived => $composableBuilder(
    column: $table.amountReceived,
    builder: (column) => column,
  );

  GeneratedColumn<double> get balanceDue => $composableBuilder(
    column: $table.balanceDue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get placeOfSupply => $composableBuilder(
    column: $table.placeOfSupply,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get ewayBillRequired => $composableBuilder(
    column: $table.ewayBillRequired,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$FinancialYearsTableAnnotationComposer get financialYearId {
    final $$FinancialYearsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.financialYearId,
      referencedTable: $db.financialYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FinancialYearsTableAnnotationComposer(
            $db: $db,
            $table: $db.financialYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoiceItemsRefs<T extends Object>(
    Expression<T> Function($$InvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$InvoiceItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          Invoice,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (Invoice, $$InvoicesTableReferences),
          Invoice,
          PrefetchHooks Function({
            bool financialYearId,
            bool customerId,
            bool invoiceItemsRefs,
          })
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> invoiceNumber = const Value.absent(),
                Value<int> financialYearId = const Value.absent(),
                Value<int> customerId = const Value.absent(),
                Value<DateTime> invoiceDate = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<String?> salesExecutive = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<double> taxableAmount = const Value.absent(),
                Value<double> cgst = const Value.absent(),
                Value<double> sgst = const Value.absent(),
                Value<double> igst = const Value.absent(),
                Value<double> roundOff = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<double> amountReceived = const Value.absent(),
                Value<double> balanceDue = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> placeOfSupply = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<bool> ewayBillRequired = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                invoiceNumber: invoiceNumber,
                financialYearId: financialYearId,
                customerId: customerId,
                invoiceDate: invoiceDate,
                dueDate: dueDate,
                salesExecutive: salesExecutive,
                subtotal: subtotal,
                discount: discount,
                taxableAmount: taxableAmount,
                cgst: cgst,
                sgst: sgst,
                igst: igst,
                roundOff: roundOff,
                grandTotal: grandTotal,
                amountReceived: amountReceived,
                balanceDue: balanceDue,
                paymentStatus: paymentStatus,
                placeOfSupply: placeOfSupply,
                paymentMethod: paymentMethod,
                ewayBillRequired: ewayBillRequired,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String invoiceNumber,
                required int financialYearId,
                required int customerId,
                required DateTime invoiceDate,
                required DateTime dueDate,
                Value<String?> salesExecutive = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<double> taxableAmount = const Value.absent(),
                Value<double> cgst = const Value.absent(),
                Value<double> sgst = const Value.absent(),
                Value<double> igst = const Value.absent(),
                Value<double> roundOff = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<double> amountReceived = const Value.absent(),
                Value<double> balanceDue = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> placeOfSupply = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<bool> ewayBillRequired = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => InvoicesCompanion.insert(
                id: id,
                invoiceNumber: invoiceNumber,
                financialYearId: financialYearId,
                customerId: customerId,
                invoiceDate: invoiceDate,
                dueDate: dueDate,
                salesExecutive: salesExecutive,
                subtotal: subtotal,
                discount: discount,
                taxableAmount: taxableAmount,
                cgst: cgst,
                sgst: sgst,
                igst: igst,
                roundOff: roundOff,
                grandTotal: grandTotal,
                amountReceived: amountReceived,
                balanceDue: balanceDue,
                paymentStatus: paymentStatus,
                placeOfSupply: placeOfSupply,
                paymentMethod: paymentMethod,
                ewayBillRequired: ewayBillRequired,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InvoicesTable, Invoice>(table),
                  $$InvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                financialYearId = false,
                customerId = false,
                invoiceItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoiceItemsRefs) db.invoiceItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (financialYearId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.financialYearId,
                                    referencedTable: $$InvoicesTableReferences
                                        ._financialYearIdTable(db),
                                    referencedColumn: $$InvoicesTableReferences
                                        ._financialYearIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (customerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.customerId,
                                    referencedTable: $$InvoicesTableReferences
                                        ._customerIdTable(db),
                                    referencedColumn: $$InvoicesTableReferences
                                        ._customerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoiceItemsRefs)
                        await $_getPrefetchedData<
                          Invoice,
                          $InvoicesTable,
                          InvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$InvoicesTableReferences
                              ._invoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).invoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      Invoice,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (Invoice, $$InvoicesTableReferences),
      Invoice,
      PrefetchHooks Function({
        bool financialYearId,
        bool customerId,
        bool invoiceItemsRefs,
      })
    >;
typedef $$InvoiceItemsTableCreateCompanionBuilder =
    InvoiceItemsCompanion Function({
      Value<int> id,
      required int invoiceId,
      required int productId,
      required String description,
      Value<String?> hsn,
      Value<double> quantity,
      Value<String> uom,
      Value<double> unitRate,
      Value<double> discountPercent,
      Value<double> taxableValue,
      Value<double> gstRate,
      Value<double> cgst,
      Value<double> sgst,
      Value<double> igst,
      Value<double> total,
    });
typedef $$InvoiceItemsTableUpdateCompanionBuilder =
    InvoiceItemsCompanion Function({
      Value<int> id,
      Value<int> invoiceId,
      Value<int> productId,
      Value<String> description,
      Value<String?> hsn,
      Value<double> quantity,
      Value<String> uom,
      Value<double> unitRate,
      Value<double> discountPercent,
      Value<double> taxableValue,
      Value<double> gstRate,
      Value<double> cgst,
      Value<double> sgst,
      Value<double> igst,
      Value<double> total,
    });

final class $$InvoiceItemsTableReferences
    extends BaseReferences<_$AppDatabase, $InvoiceItemsTable, InvoiceItem> {
  $$InvoiceItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoices.createAlias('invoice_items__invoice_id__invoices__id');

  $$InvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id')!;

    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('invoice_items__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InvoiceItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hsn => $composableBuilder(
    column: $table.hsn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uom => $composableBuilder(
    column: $table.uom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitRate => $composableBuilder(
    column: $table.unitRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxableValue => $composableBuilder(
    column: $table.taxableValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gstRate => $composableBuilder(
    column: $table.gstRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cgst => $composableBuilder(
    column: $table.cgst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sgst => $composableBuilder(
    column: $table.sgst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get igst => $composableBuilder(
    column: $table.igst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hsn => $composableBuilder(
    column: $table.hsn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uom => $composableBuilder(
    column: $table.uom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitRate => $composableBuilder(
    column: $table.unitRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxableValue => $composableBuilder(
    column: $table.taxableValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gstRate => $composableBuilder(
    column: $table.gstRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cgst => $composableBuilder(
    column: $table.cgst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sgst => $composableBuilder(
    column: $table.sgst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get igst => $composableBuilder(
    column: $table.igst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hsn =>
      $composableBuilder(column: $table.hsn, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get uom =>
      $composableBuilder(column: $table.uom, builder: (column) => column);

  GeneratedColumn<double> get unitRate =>
      $composableBuilder(column: $table.unitRate, builder: (column) => column);

  GeneratedColumn<double> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get taxableValue => $composableBuilder(
    column: $table.taxableValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get gstRate =>
      $composableBuilder(column: $table.gstRate, builder: (column) => column);

  GeneratedColumn<double> get cgst =>
      $composableBuilder(column: $table.cgst, builder: (column) => column);

  GeneratedColumn<double> get sgst =>
      $composableBuilder(column: $table.sgst, builder: (column) => column);

  GeneratedColumn<double> get igst =>
      $composableBuilder(column: $table.igst, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoiceItemsTable,
          InvoiceItem,
          $$InvoiceItemsTableFilterComposer,
          $$InvoiceItemsTableOrderingComposer,
          $$InvoiceItemsTableAnnotationComposer,
          $$InvoiceItemsTableCreateCompanionBuilder,
          $$InvoiceItemsTableUpdateCompanionBuilder,
          (InvoiceItem, $$InvoiceItemsTableReferences),
          InvoiceItem,
          PrefetchHooks Function({bool invoiceId, bool productId})
        > {
  $$InvoiceItemsTableTableManager(_$AppDatabase db, $InvoiceItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> hsn = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<String> uom = const Value.absent(),
                Value<double> unitRate = const Value.absent(),
                Value<double> discountPercent = const Value.absent(),
                Value<double> taxableValue = const Value.absent(),
                Value<double> gstRate = const Value.absent(),
                Value<double> cgst = const Value.absent(),
                Value<double> sgst = const Value.absent(),
                Value<double> igst = const Value.absent(),
                Value<double> total = const Value.absent(),
              }) => InvoiceItemsCompanion(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                description: description,
                hsn: hsn,
                quantity: quantity,
                uom: uom,
                unitRate: unitRate,
                discountPercent: discountPercent,
                taxableValue: taxableValue,
                gstRate: gstRate,
                cgst: cgst,
                sgst: sgst,
                igst: igst,
                total: total,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoiceId,
                required int productId,
                required String description,
                Value<String?> hsn = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<String> uom = const Value.absent(),
                Value<double> unitRate = const Value.absent(),
                Value<double> discountPercent = const Value.absent(),
                Value<double> taxableValue = const Value.absent(),
                Value<double> gstRate = const Value.absent(),
                Value<double> cgst = const Value.absent(),
                Value<double> sgst = const Value.absent(),
                Value<double> igst = const Value.absent(),
                Value<double> total = const Value.absent(),
              }) => InvoiceItemsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                description: description,
                hsn: hsn,
                quantity: quantity,
                uom: uom,
                unitRate: unitRate,
                discountPercent: discountPercent,
                taxableValue: taxableValue,
                gstRate: gstRate,
                cgst: cgst,
                sgst: sgst,
                igst: igst,
                total: total,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InvoiceItemsTable, InvoiceItem>(table),
                  $$InvoiceItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoiceId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (invoiceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.invoiceId,
                                referencedTable: $$InvoiceItemsTableReferences
                                    ._invoiceIdTable(db),
                                referencedColumn: $$InvoiceItemsTableReferences
                                    ._invoiceIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$InvoiceItemsTableReferences
                                    ._productIdTable(db),
                                referencedColumn: $$InvoiceItemsTableReferences
                                    ._productIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InvoiceItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoiceItemsTable,
      InvoiceItem,
      $$InvoiceItemsTableFilterComposer,
      $$InvoiceItemsTableOrderingComposer,
      $$InvoiceItemsTableAnnotationComposer,
      $$InvoiceItemsTableCreateCompanionBuilder,
      $$InvoiceItemsTableUpdateCompanionBuilder,
      (InvoiceItem, $$InvoiceItemsTableReferences),
      InvoiceItem,
      PrefetchHooks Function({bool invoiceId, bool productId})
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      required int customerId,
      required double amount,
      Value<String> paymentMode,
      Value<DateTime> paymentDate,
      Value<String?> referenceNumber,
      Value<String?> remarks,
      Value<DateTime> createdAt,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      Value<int> customerId,
      Value<double> amount,
      Value<String> paymentMode,
      Value<DateTime> paymentDate,
      Value<String?> referenceNumber,
      Value<String?> remarks,
      Value<DateTime> createdAt,
    });

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, Payment> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias('payments__customer_id__customers__id');

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMode => $composableBuilder(
    column: $table.paymentMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceNumber => $composableBuilder(
    column: $table.referenceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remarks => $composableBuilder(
    column: $table.remarks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMode => $composableBuilder(
    column: $table.paymentMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceNumber => $composableBuilder(
    column: $table.referenceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remarks => $composableBuilder(
    column: $table.remarks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableOrderingComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get paymentMode => $composableBuilder(
    column: $table.paymentMode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referenceNumber => $composableBuilder(
    column: $table.referenceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, $$PaymentsTableReferences),
          Payment,
          PrefetchHooks Function({bool customerId})
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> customerId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> paymentMode = const Value.absent(),
                Value<DateTime> paymentDate = const Value.absent(),
                Value<String?> referenceNumber = const Value.absent(),
                Value<String?> remarks = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                customerId: customerId,
                amount: amount,
                paymentMode: paymentMode,
                paymentDate: paymentDate,
                referenceNumber: referenceNumber,
                remarks: remarks,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int customerId,
                required double amount,
                Value<String> paymentMode = const Value.absent(),
                Value<DateTime> paymentDate = const Value.absent(),
                Value<String?> referenceNumber = const Value.absent(),
                Value<String?> remarks = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                customerId: customerId,
                amount: amount,
                paymentMode: paymentMode,
                paymentDate: paymentDate,
                referenceNumber: referenceNumber,
                remarks: remarks,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PaymentsTable, Payment>(table),
                  $$PaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({customerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (customerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.customerId,
                                referencedTable: $$PaymentsTableReferences
                                    ._customerIdTable(db),
                                referencedColumn: $$PaymentsTableReferences
                                    ._customerIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, $$PaymentsTableReferences),
      Payment,
      PrefetchHooks Function({bool customerId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CompaniesTableTableManager get companies =>
      $$CompaniesTableTableManager(_db, _db.companies);
  $$FinancialYearsTableTableManager get financialYears =>
      $$FinancialYearsTableTableManager(_db, _db.financialYears);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$InvoiceItemsTableTableManager get invoiceItems =>
      $$InvoiceItemsTableTableManager(_db, _db.invoiceItems);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
}

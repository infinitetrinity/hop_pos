// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, fullName, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<DateTime?> lastSyncedAt;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    this.lastSyncedAt = const Value.absent(),
  }) : fullName = Value(fullName);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<DateTime>? lastSyncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
    });
  }

  UsersTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<DateTime?>? lastSyncedAt}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }
}

class $PosLicensesTableTable extends PosLicensesTable
    with TableInfo<$PosLicensesTableTable, PosLicense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PosLicensesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _invoicePrefixMeta =
      const VerificationMeta('invoicePrefix');
  @override
  late final GeneratedColumn<String> invoicePrefix = GeneratedColumn<String>(
      'invoice_prefix', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _licenseKeyMeta =
      const VerificationMeta('licenseKey');
  @override
  late final GeneratedColumn<String> licenseKey = GeneratedColumn<String>(
      'license_key', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  static const VerificationMeta _isActivatedMeta =
      const VerificationMeta('isActivated');
  @override
  late final GeneratedColumn<bool> isActivated = GeneratedColumn<bool>(
      'is_activated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_activated" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, invoicePrefix, licenseKey, password, isActive, isActivated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pos_licenses';
  @override
  VerificationContext validateIntegrity(Insertable<PosLicense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('invoice_prefix')) {
      context.handle(
          _invoicePrefixMeta,
          invoicePrefix.isAcceptableOrUnknown(
              data['invoice_prefix']!, _invoicePrefixMeta));
    } else if (isInserting) {
      context.missing(_invoicePrefixMeta);
    }
    if (data.containsKey('license_key')) {
      context.handle(
          _licenseKeyMeta,
          licenseKey.isAcceptableOrUnknown(
              data['license_key']!, _licenseKeyMeta));
    } else if (isInserting) {
      context.missing(_licenseKeyMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('is_activated')) {
      context.handle(
          _isActivatedMeta,
          isActivated.isAcceptableOrUnknown(
              data['is_activated']!, _isActivatedMeta));
    } else if (isInserting) {
      context.missing(_isActivatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PosLicense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PosLicense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      invoicePrefix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_prefix'])!,
      licenseKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}license_key'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isActivated: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_activated'])!,
    );
  }

  @override
  $PosLicensesTableTable createAlias(String alias) {
    return $PosLicensesTableTable(attachedDatabase, alias);
  }
}

class PosLicensesTableCompanion extends UpdateCompanion<PosLicense> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> invoicePrefix;
  final Value<String> licenseKey;
  final Value<String> password;
  final Value<bool> isActive;
  final Value<bool> isActivated;
  const PosLicensesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.invoicePrefix = const Value.absent(),
    this.licenseKey = const Value.absent(),
    this.password = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isActivated = const Value.absent(),
  });
  PosLicensesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String invoicePrefix,
    required String licenseKey,
    required String password,
    required bool isActive,
    required bool isActivated,
  })  : name = Value(name),
        invoicePrefix = Value(invoicePrefix),
        licenseKey = Value(licenseKey),
        password = Value(password),
        isActive = Value(isActive),
        isActivated = Value(isActivated);
  static Insertable<PosLicense> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? invoicePrefix,
    Expression<String>? licenseKey,
    Expression<String>? password,
    Expression<bool>? isActive,
    Expression<bool>? isActivated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (invoicePrefix != null) 'invoice_prefix': invoicePrefix,
      if (licenseKey != null) 'license_key': licenseKey,
      if (password != null) 'password': password,
      if (isActive != null) 'is_active': isActive,
      if (isActivated != null) 'is_activated': isActivated,
    });
  }

  PosLicensesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? invoicePrefix,
      Value<String>? licenseKey,
      Value<String>? password,
      Value<bool>? isActive,
      Value<bool>? isActivated}) {
    return PosLicensesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      invoicePrefix: invoicePrefix ?? this.invoicePrefix,
      licenseKey: licenseKey ?? this.licenseKey,
      password: password ?? this.password,
      isActive: isActive ?? this.isActive,
      isActivated: isActivated ?? this.isActivated,
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
    if (invoicePrefix.present) {
      map['invoice_prefix'] = Variable<String>(invoicePrefix.value);
    }
    if (licenseKey.present) {
      map['license_key'] = Variable<String>(licenseKey.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isActivated.present) {
      map['is_activated'] = Variable<bool>(isActivated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PosLicensesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('invoicePrefix: $invoicePrefix, ')
          ..write('licenseKey: $licenseKey, ')
          ..write('password: $password, ')
          ..write('isActive: $isActive, ')
          ..write('isActivated: $isActivated')
          ..write(')'))
        .toString();
  }
}

class $CompanyTableTable extends CompanyTable
    with TableInfo<$CompanyTableTable, Company> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _telephoneMeta =
      const VerificationMeta('telephone');
  @override
  late final GeneratedColumn<String> telephone = GeneratedColumn<String>(
      'telephone', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _faxMeta = const VerificationMeta('fax');
  @override
  late final GeneratedColumn<String> fax = GeneratedColumn<String>(
      'fax', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _coRegistrationNoMeta =
      const VerificationMeta('coRegistrationNo');
  @override
  late final GeneratedColumn<String> coRegistrationNo = GeneratedColumn<String>(
      'co_registration_no', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        address,
        postalCode,
        email,
        telephone,
        fax,
        website,
        coRegistrationNo
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company';
  @override
  VerificationContext validateIntegrity(Insertable<Company> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('telephone')) {
      context.handle(_telephoneMeta,
          telephone.isAcceptableOrUnknown(data['telephone']!, _telephoneMeta));
    }
    if (data.containsKey('fax')) {
      context.handle(
          _faxMeta, fax.isAcceptableOrUnknown(data['fax']!, _faxMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('co_registration_no')) {
      context.handle(
          _coRegistrationNoMeta,
          coRegistrationNo.isAcceptableOrUnknown(
              data['co_registration_no']!, _coRegistrationNoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Company map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Company(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      telephone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telephone']),
      fax: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fax']),
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website']),
      coRegistrationNo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}co_registration_no']),
    );
  }

  @override
  $CompanyTableTable createAlias(String alias) {
    return $CompanyTableTable(attachedDatabase, alias);
  }
}

class CompanyTableCompanion extends UpdateCompanion<Company> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> address;
  final Value<String?> postalCode;
  final Value<String?> email;
  final Value<String?> telephone;
  final Value<String?> fax;
  final Value<String?> website;
  final Value<String?> coRegistrationNo;
  const CompanyTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.email = const Value.absent(),
    this.telephone = const Value.absent(),
    this.fax = const Value.absent(),
    this.website = const Value.absent(),
    this.coRegistrationNo = const Value.absent(),
  });
  CompanyTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.address = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.email = const Value.absent(),
    this.telephone = const Value.absent(),
    this.fax = const Value.absent(),
    this.website = const Value.absent(),
    this.coRegistrationNo = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Company> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? postalCode,
    Expression<String>? email,
    Expression<String>? telephone,
    Expression<String>? fax,
    Expression<String>? website,
    Expression<String>? coRegistrationNo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (postalCode != null) 'postal_code': postalCode,
      if (email != null) 'email': email,
      if (telephone != null) 'telephone': telephone,
      if (fax != null) 'fax': fax,
      if (website != null) 'website': website,
      if (coRegistrationNo != null) 'co_registration_no': coRegistrationNo,
    });
  }

  CompanyTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? address,
      Value<String?>? postalCode,
      Value<String?>? email,
      Value<String?>? telephone,
      Value<String?>? fax,
      Value<String?>? website,
      Value<String?>? coRegistrationNo}) {
    return CompanyTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      fax: fax ?? this.fax,
      website: website ?? this.website,
      coRegistrationNo: coRegistrationNo ?? this.coRegistrationNo,
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
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (telephone.present) {
      map['telephone'] = Variable<String>(telephone.value);
    }
    if (fax.present) {
      map['fax'] = Variable<String>(fax.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (coRegistrationNo.present) {
      map['co_registration_no'] = Variable<String>(coRegistrationNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('postalCode: $postalCode, ')
          ..write('email: $email, ')
          ..write('telephone: $telephone, ')
          ..write('fax: $fax, ')
          ..write('website: $website, ')
          ..write('coRegistrationNo: $coRegistrationNo')
          ..write(')'))
        .toString();
  }
}

class $ReceiptSettingsTableTable extends ReceiptSettingsTable
    with TableInfo<$ReceiptSettingsTableTable, ReceiptSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _footerTextMeta =
      const VerificationMeta('footerText');
  @override
  late final GeneratedColumn<String> footerText = GeneratedColumn<String>(
      'footer_text', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _outstandingSpecimenTitleMeta =
      const VerificationMeta('outstandingSpecimenTitle');
  @override
  late final GeneratedColumn<String> outstandingSpecimenTitle =
      GeneratedColumn<String>('outstanding_specimen_title', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _outstandingSpecimenNoticeTitleMeta =
      const VerificationMeta('outstandingSpecimenNoticeTitle');
  @override
  late final GeneratedColumn<String> outstandingSpecimenNoticeTitle =
      GeneratedColumn<String>(
          'outstanding_specimen_notice_title', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _outstandingSpecimenNoticeMeta =
      const VerificationMeta('outstandingSpecimenNotice');
  @override
  late final GeneratedColumn<String> outstandingSpecimenNotice =
      GeneratedColumn<String>('outstanding_specimen_notice', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _utfTitleMeta =
      const VerificationMeta('utfTitle');
  @override
  late final GeneratedColumn<String> utfTitle = GeneratedColumn<String>(
      'utf_title', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _utfNoticeMeta =
      const VerificationMeta('utfNotice');
  @override
  late final GeneratedColumn<String> utfNotice = GeneratedColumn<String>(
      'utf_notice', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _stfTitleMeta =
      const VerificationMeta('stfTitle');
  @override
  late final GeneratedColumn<String> stfTitle = GeneratedColumn<String>(
      'stf_title', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _stfNoticeMeta =
      const VerificationMeta('stfNotice');
  @override
  late final GeneratedColumn<String> stfNotice = GeneratedColumn<String>(
      'stf_notice', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        footerText,
        outstandingSpecimenTitle,
        outstandingSpecimenNoticeTitle,
        outstandingSpecimenNotice,
        utfTitle,
        utfNotice,
        stfTitle,
        stfNotice
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipt_settings';
  @override
  VerificationContext validateIntegrity(Insertable<ReceiptSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('footer_text')) {
      context.handle(
          _footerTextMeta,
          footerText.isAcceptableOrUnknown(
              data['footer_text']!, _footerTextMeta));
    }
    if (data.containsKey('outstanding_specimen_title')) {
      context.handle(
          _outstandingSpecimenTitleMeta,
          outstandingSpecimenTitle.isAcceptableOrUnknown(
              data['outstanding_specimen_title']!,
              _outstandingSpecimenTitleMeta));
    }
    if (data.containsKey('outstanding_specimen_notice_title')) {
      context.handle(
          _outstandingSpecimenNoticeTitleMeta,
          outstandingSpecimenNoticeTitle.isAcceptableOrUnknown(
              data['outstanding_specimen_notice_title']!,
              _outstandingSpecimenNoticeTitleMeta));
    }
    if (data.containsKey('outstanding_specimen_notice')) {
      context.handle(
          _outstandingSpecimenNoticeMeta,
          outstandingSpecimenNotice.isAcceptableOrUnknown(
              data['outstanding_specimen_notice']!,
              _outstandingSpecimenNoticeMeta));
    }
    if (data.containsKey('utf_title')) {
      context.handle(_utfTitleMeta,
          utfTitle.isAcceptableOrUnknown(data['utf_title']!, _utfTitleMeta));
    }
    if (data.containsKey('utf_notice')) {
      context.handle(_utfNoticeMeta,
          utfNotice.isAcceptableOrUnknown(data['utf_notice']!, _utfNoticeMeta));
    }
    if (data.containsKey('stf_title')) {
      context.handle(_stfTitleMeta,
          stfTitle.isAcceptableOrUnknown(data['stf_title']!, _stfTitleMeta));
    }
    if (data.containsKey('stf_notice')) {
      context.handle(_stfNoticeMeta,
          stfNotice.isAcceptableOrUnknown(data['stf_notice']!, _stfNoticeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReceiptSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReceiptSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      footerText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}footer_text']),
      outstandingSpecimenTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}outstanding_specimen_title']),
      outstandingSpecimenNoticeTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}outstanding_specimen_notice_title']),
      outstandingSpecimenNotice: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}outstanding_specimen_notice']),
      utfTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}utf_title']),
      utfNotice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}utf_notice']),
      stfTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stf_title']),
      stfNotice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stf_notice']),
    );
  }

  @override
  $ReceiptSettingsTableTable createAlias(String alias) {
    return $ReceiptSettingsTableTable(attachedDatabase, alias);
  }
}

class ReceiptSettingsTableCompanion extends UpdateCompanion<ReceiptSetting> {
  final Value<int> id;
  final Value<String?> footerText;
  final Value<String?> outstandingSpecimenTitle;
  final Value<String?> outstandingSpecimenNoticeTitle;
  final Value<String?> outstandingSpecimenNotice;
  final Value<String?> utfTitle;
  final Value<String?> utfNotice;
  final Value<String?> stfTitle;
  final Value<String?> stfNotice;
  const ReceiptSettingsTableCompanion({
    this.id = const Value.absent(),
    this.footerText = const Value.absent(),
    this.outstandingSpecimenTitle = const Value.absent(),
    this.outstandingSpecimenNoticeTitle = const Value.absent(),
    this.outstandingSpecimenNotice = const Value.absent(),
    this.utfTitle = const Value.absent(),
    this.utfNotice = const Value.absent(),
    this.stfTitle = const Value.absent(),
    this.stfNotice = const Value.absent(),
  });
  ReceiptSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.footerText = const Value.absent(),
    this.outstandingSpecimenTitle = const Value.absent(),
    this.outstandingSpecimenNoticeTitle = const Value.absent(),
    this.outstandingSpecimenNotice = const Value.absent(),
    this.utfTitle = const Value.absent(),
    this.utfNotice = const Value.absent(),
    this.stfTitle = const Value.absent(),
    this.stfNotice = const Value.absent(),
  });
  static Insertable<ReceiptSetting> custom({
    Expression<int>? id,
    Expression<String>? footerText,
    Expression<String>? outstandingSpecimenTitle,
    Expression<String>? outstandingSpecimenNoticeTitle,
    Expression<String>? outstandingSpecimenNotice,
    Expression<String>? utfTitle,
    Expression<String>? utfNotice,
    Expression<String>? stfTitle,
    Expression<String>? stfNotice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (footerText != null) 'footer_text': footerText,
      if (outstandingSpecimenTitle != null)
        'outstanding_specimen_title': outstandingSpecimenTitle,
      if (outstandingSpecimenNoticeTitle != null)
        'outstanding_specimen_notice_title': outstandingSpecimenNoticeTitle,
      if (outstandingSpecimenNotice != null)
        'outstanding_specimen_notice': outstandingSpecimenNotice,
      if (utfTitle != null) 'utf_title': utfTitle,
      if (utfNotice != null) 'utf_notice': utfNotice,
      if (stfTitle != null) 'stf_title': stfTitle,
      if (stfNotice != null) 'stf_notice': stfNotice,
    });
  }

  ReceiptSettingsTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? footerText,
      Value<String?>? outstandingSpecimenTitle,
      Value<String?>? outstandingSpecimenNoticeTitle,
      Value<String?>? outstandingSpecimenNotice,
      Value<String?>? utfTitle,
      Value<String?>? utfNotice,
      Value<String?>? stfTitle,
      Value<String?>? stfNotice}) {
    return ReceiptSettingsTableCompanion(
      id: id ?? this.id,
      footerText: footerText ?? this.footerText,
      outstandingSpecimenTitle:
          outstandingSpecimenTitle ?? this.outstandingSpecimenTitle,
      outstandingSpecimenNoticeTitle:
          outstandingSpecimenNoticeTitle ?? this.outstandingSpecimenNoticeTitle,
      outstandingSpecimenNotice:
          outstandingSpecimenNotice ?? this.outstandingSpecimenNotice,
      utfTitle: utfTitle ?? this.utfTitle,
      utfNotice: utfNotice ?? this.utfNotice,
      stfTitle: stfTitle ?? this.stfTitle,
      stfNotice: stfNotice ?? this.stfNotice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (footerText.present) {
      map['footer_text'] = Variable<String>(footerText.value);
    }
    if (outstandingSpecimenTitle.present) {
      map['outstanding_specimen_title'] =
          Variable<String>(outstandingSpecimenTitle.value);
    }
    if (outstandingSpecimenNoticeTitle.present) {
      map['outstanding_specimen_notice_title'] =
          Variable<String>(outstandingSpecimenNoticeTitle.value);
    }
    if (outstandingSpecimenNotice.present) {
      map['outstanding_specimen_notice'] =
          Variable<String>(outstandingSpecimenNotice.value);
    }
    if (utfTitle.present) {
      map['utf_title'] = Variable<String>(utfTitle.value);
    }
    if (utfNotice.present) {
      map['utf_notice'] = Variable<String>(utfNotice.value);
    }
    if (stfTitle.present) {
      map['stf_title'] = Variable<String>(stfTitle.value);
    }
    if (stfNotice.present) {
      map['stf_notice'] = Variable<String>(stfNotice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('footerText: $footerText, ')
          ..write('outstandingSpecimenTitle: $outstandingSpecimenTitle, ')
          ..write(
              'outstandingSpecimenNoticeTitle: $outstandingSpecimenNoticeTitle, ')
          ..write('outstandingSpecimenNotice: $outstandingSpecimenNotice, ')
          ..write('utfTitle: $utfTitle, ')
          ..write('utfNotice: $utfNotice, ')
          ..write('stfTitle: $stfTitle, ')
          ..write('stfNotice: $stfNotice')
          ..write(')'))
        .toString();
  }
}

class $PosExtrasTableTable extends PosExtrasTable
    with TableInfo<$PosExtrasTableTable, PosExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PosExtrasTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountTypeMeta =
      const VerificationMeta('amountType');
  @override
  late final GeneratedColumn<String> amountType = GeneratedColumn<String>(
      'amount_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, type, amount, amountType, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pos_extras';
  @override
  VerificationContext validateIntegrity(Insertable<PosExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('amount_type')) {
      context.handle(
          _amountTypeMeta,
          amountType.isAcceptableOrUnknown(
              data['amount_type']!, _amountTypeMeta));
    } else if (isInserting) {
      context.missing(_amountTypeMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PosExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PosExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      amountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount_type'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $PosExtrasTableTable createAlias(String alias) {
    return $PosExtrasTableTable(attachedDatabase, alias);
  }
}

class PosExtrasTableCompanion extends UpdateCompanion<PosExtra> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> type;
  final Value<double> amount;
  final Value<String> amountType;
  final Value<bool> isActive;
  const PosExtrasTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.amountType = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  PosExtrasTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required String type,
    required double amount,
    required String amountType,
    required bool isActive,
  })  : name = Value(name),
        type = Value(type),
        amount = Value(amount),
        amountType = Value(amountType),
        isActive = Value(isActive);
  static Insertable<PosExtra> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
    Expression<double>? amount,
    Expression<String>? amountType,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (amountType != null) 'amount_type': amountType,
      if (isActive != null) 'is_active': isActive,
    });
  }

  PosExtrasTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? type,
      Value<double>? amount,
      Value<String>? amountType,
      Value<bool>? isActive}) {
    return PosExtrasTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      amountType: amountType ?? this.amountType,
      isActive: isActive ?? this.isActive,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (amountType.present) {
      map['amount_type'] = Variable<String>(amountType.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PosExtrasTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('amountType: $amountType, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $PaymentMethodsTableTable extends PaymentMethodsTable
    with TableInfo<$PaymentMethodsTableTable, PaymentMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentMethodsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_methods';
  @override
  VerificationContext validateIntegrity(Insertable<PaymentMethod> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentMethod(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $PaymentMethodsTableTable createAlias(String alias) {
    return $PaymentMethodsTableTable(attachedDatabase, alias);
  }
}

class PaymentMethodsTableCompanion extends UpdateCompanion<PaymentMethod> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  const PaymentMethodsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  PaymentMethodsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PaymentMethod> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  PaymentMethodsTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? description}) {
    return PaymentMethodsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentMethodsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $ProductCategoriesTableTable extends ProductCategoriesTable
    with TableInfo<$ProductCategoriesTableTable, ProductCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _colorCodeMeta =
      const VerificationMeta('colorCode');
  @override
  late final GeneratedColumn<String> colorCode = GeneratedColumn<String>(
      'color_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, colorCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_categories';
  @override
  VerificationContext validateIntegrity(Insertable<ProductCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('color_code')) {
      context.handle(_colorCodeMeta,
          colorCode.isAcceptableOrUnknown(data['color_code']!, _colorCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      colorCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_code']),
    );
  }

  @override
  $ProductCategoriesTableTable createAlias(String alias) {
    return $ProductCategoriesTableTable(attachedDatabase, alias);
  }
}

class ProductCategoriesTableCompanion extends UpdateCompanion<ProductCategory> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> colorCode;
  const ProductCategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.colorCode = const Value.absent(),
  });
  ProductCategoriesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.colorCode = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ProductCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? colorCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (colorCode != null) 'color_code': colorCode,
    });
  }

  ProductCategoriesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? colorCode}) {
    return ProductCategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      colorCode: colorCode ?? this.colorCode,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (colorCode.present) {
      map['color_code'] = Variable<String>(colorCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('colorCode: $colorCode')
          ..write(')'))
        .toString();
  }
}

class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _colorCodeMeta =
      const VerificationMeta('colorCode');
  @override
  late final GeneratedColumn<String> colorCode = GeneratedColumn<String>(
      'color_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_categories (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, sku, price, description, colorCode, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('color_code')) {
      context.handle(_colorCodeMeta,
          colorCode.isAcceptableOrUnknown(data['color_code']!, _colorCodeMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      colorCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_code']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }
}

class ProductsTableCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> sku;
  final Value<double> price;
  final Value<String?> description;
  final Value<String?> colorCode;
  final Value<int?> categoryId;
  const ProductsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.price = const Value.absent(),
    this.description = const Value.absent(),
    this.colorCode = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String sku,
    required double price,
    this.description = const Value.absent(),
    this.colorCode = const Value.absent(),
    this.categoryId = const Value.absent(),
  })  : name = Value(name),
        sku = Value(sku),
        price = Value(price);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<double>? price,
    Expression<String>? description,
    Expression<String>? colorCode,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (colorCode != null) 'color_code': colorCode,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  ProductsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? sku,
      Value<double>? price,
      Value<String?>? description,
      Value<String?>? colorCode,
      Value<int?>? categoryId}) {
    return ProductsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      description: description ?? this.description,
      colorCode: colorCode ?? this.colorCode,
      categoryId: categoryId ?? this.categoryId,
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
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (colorCode.present) {
      map['color_code'] = Variable<String>(colorCode.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('colorCode: $colorCode, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $CustomersTableTable extends CustomersTable
    with TableInfo<$CustomersTableTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nricMeta = const VerificationMeta('nric');
  @override
  late final GeneratedColumn<String> nric = GeneratedColumn<String>(
      'nric', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
      'dob', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _mobileNoMeta =
      const VerificationMeta('mobileNo');
  @override
  late final GeneratedColumn<String> mobileNo = GeneratedColumn<String>(
      'mobile_no', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _isPendingMeta =
      const VerificationMeta('isPending');
  @override
  late final GeneratedColumn<bool> isPending = GeneratedColumn<bool>(
      'is_pending', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_pending" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, fullName, nric, dob, gender, email, mobileNo, isPending];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('nric')) {
      context.handle(
          _nricMeta, nric.isAcceptableOrUnknown(data['nric']!, _nricMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('mobile_no')) {
      context.handle(_mobileNoMeta,
          mobileNo.isAcceptableOrUnknown(data['mobile_no']!, _mobileNoMeta));
    }
    if (data.containsKey('is_pending')) {
      context.handle(_isPendingMeta,
          isPending.isAcceptableOrUnknown(data['is_pending']!, _isPendingMeta));
    } else if (isInserting) {
      context.missing(_isPendingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      nric: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nric']),
      dob: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dob']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      mobileNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mobile_no']),
      isPending: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_pending'])!,
    );
  }

  @override
  $CustomersTableTable createAlias(String alias) {
    return $CustomersTableTable(attachedDatabase, alias);
  }
}

class CustomersTableCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String?> nric;
  final Value<DateTime?> dob;
  final Value<String?> gender;
  final Value<String?> email;
  final Value<String?> mobileNo;
  final Value<bool> isPending;
  const CustomersTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nric = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.email = const Value.absent(),
    this.mobileNo = const Value.absent(),
    this.isPending = const Value.absent(),
  });
  CustomersTableCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    this.nric = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.email = const Value.absent(),
    this.mobileNo = const Value.absent(),
    required bool isPending,
  })  : fullName = Value(fullName),
        isPending = Value(isPending);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? nric,
    Expression<DateTime>? dob,
    Expression<String>? gender,
    Expression<String>? email,
    Expression<String>? mobileNo,
    Expression<bool>? isPending,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (nric != null) 'nric': nric,
      if (dob != null) 'dob': dob,
      if (gender != null) 'gender': gender,
      if (email != null) 'email': email,
      if (mobileNo != null) 'mobile_no': mobileNo,
      if (isPending != null) 'is_pending': isPending,
    });
  }

  CustomersTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String?>? nric,
      Value<DateTime?>? dob,
      Value<String?>? gender,
      Value<String?>? email,
      Value<String?>? mobileNo,
      Value<bool>? isPending}) {
    return CustomersTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      nric: nric ?? this.nric,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      mobileNo: mobileNo ?? this.mobileNo,
      isPending: isPending ?? this.isPending,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (nric.present) {
      map['nric'] = Variable<String>(nric.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (mobileNo.present) {
      map['mobile_no'] = Variable<String>(mobileNo.value);
    }
    if (isPending.present) {
      map['is_pending'] = Variable<bool>(isPending.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('nric: $nric, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('email: $email, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('isPending: $isPending')
          ..write(')'))
        .toString();
  }
}

class $ScreeningsTableTable extends ScreeningsTable
    with TableInfo<$ScreeningsTableTable, Screening> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreeningsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _corporateMeta =
      const VerificationMeta('corporate');
  @override
  late final GeneratedColumn<String> corporate = GeneratedColumn<String>(
      'corporate', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, corporate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screenings';
  @override
  VerificationContext validateIntegrity(Insertable<Screening> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('corporate')) {
      context.handle(_corporateMeta,
          corporate.isAcceptableOrUnknown(data['corporate']!, _corporateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Screening map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Screening(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      corporate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}corporate']),
    );
  }

  @override
  $ScreeningsTableTable createAlias(String alias) {
    return $ScreeningsTableTable(attachedDatabase, alias);
  }
}

class ScreeningsTableCompanion extends UpdateCompanion<Screening> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> corporate;
  const ScreeningsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.corporate = const Value.absent(),
  });
  ScreeningsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.corporate = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Screening> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? corporate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (corporate != null) 'corporate': corporate,
    });
  }

  ScreeningsTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? corporate}) {
    return ScreeningsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      corporate: corporate ?? this.corporate,
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
    if (corporate.present) {
      map['corporate'] = Variable<String>(corporate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreeningsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('corporate: $corporate')
          ..write(')'))
        .toString();
  }
}

class $ScreeningVenuesTableTable extends ScreeningVenuesTable
    with TableInfo<$ScreeningVenuesTableTable, ScreeningVenue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreeningVenuesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fullAddressMeta =
      const VerificationMeta('fullAddress');
  @override
  late final GeneratedColumn<String> fullAddress = GeneratedColumn<String>(
      'full_address', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _screeningFormIdMeta =
      const VerificationMeta('screeningFormId');
  @override
  late final GeneratedColumn<int> screeningFormId = GeneratedColumn<int>(
      'screening_form_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES screenings (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, fullAddress, screeningFormId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screening_venues';
  @override
  VerificationContext validateIntegrity(Insertable<ScreeningVenue> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('full_address')) {
      context.handle(
          _fullAddressMeta,
          fullAddress.isAcceptableOrUnknown(
              data['full_address']!, _fullAddressMeta));
    }
    if (data.containsKey('screening_form_id')) {
      context.handle(
          _screeningFormIdMeta,
          screeningFormId.isAcceptableOrUnknown(
              data['screening_form_id']!, _screeningFormIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScreeningVenue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreeningVenue(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      fullAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_address']),
      screeningFormId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}screening_form_id']),
    );
  }

  @override
  $ScreeningVenuesTableTable createAlias(String alias) {
    return $ScreeningVenuesTableTable(attachedDatabase, alias);
  }
}

class ScreeningVenuesTableCompanion extends UpdateCompanion<ScreeningVenue> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> fullAddress;
  final Value<int?> screeningFormId;
  const ScreeningVenuesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.fullAddress = const Value.absent(),
    this.screeningFormId = const Value.absent(),
  });
  ScreeningVenuesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.fullAddress = const Value.absent(),
    this.screeningFormId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ScreeningVenue> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? fullAddress,
    Expression<int>? screeningFormId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (fullAddress != null) 'full_address': fullAddress,
      if (screeningFormId != null) 'screening_form_id': screeningFormId,
    });
  }

  ScreeningVenuesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? fullAddress,
      Value<int?>? screeningFormId}) {
    return ScreeningVenuesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      fullAddress: fullAddress ?? this.fullAddress,
      screeningFormId: screeningFormId ?? this.screeningFormId,
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
    if (fullAddress.present) {
      map['full_address'] = Variable<String>(fullAddress.value);
    }
    if (screeningFormId.present) {
      map['screening_form_id'] = Variable<int>(screeningFormId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreeningVenuesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fullAddress: $fullAddress, ')
          ..write('screeningFormId: $screeningFormId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $PosLicensesTableTable posLicensesTable =
      $PosLicensesTableTable(this);
  late final $CompanyTableTable companyTable = $CompanyTableTable(this);
  late final $ReceiptSettingsTableTable receiptSettingsTable =
      $ReceiptSettingsTableTable(this);
  late final $PosExtrasTableTable posExtrasTable = $PosExtrasTableTable(this);
  late final $PaymentMethodsTableTable paymentMethodsTable =
      $PaymentMethodsTableTable(this);
  late final $ProductCategoriesTableTable productCategoriesTable =
      $ProductCategoriesTableTable(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $CustomersTableTable customersTable = $CustomersTableTable(this);
  late final $ScreeningsTableTable screeningsTable =
      $ScreeningsTableTable(this);
  late final $ScreeningVenuesTableTable screeningVenuesTable =
      $ScreeningVenuesTableTable(this);
  late final UserDao userDao = UserDao(this as AppDb);
  late final PosLicenseDao posLicenseDao = PosLicenseDao(this as AppDb);
  late final CompanyDao companyDao = CompanyDao(this as AppDb);
  late final ReceiptSettingDao receiptSettingDao =
      ReceiptSettingDao(this as AppDb);
  late final PosExtraDao posExtraDao = PosExtraDao(this as AppDb);
  late final PaymentMethodDao paymentMethodDao =
      PaymentMethodDao(this as AppDb);
  late final ProductCategoryDao productCategoryDao =
      ProductCategoryDao(this as AppDb);
  late final ProductDao productDao = ProductDao(this as AppDb);
  late final CustomerDao customerDao = CustomerDao(this as AppDb);
  late final ScreeningDao screeningDao = ScreeningDao(this as AppDb);
  late final ScreeningVenueDao screeningVenueDao =
      ScreeningVenueDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        usersTable,
        posLicensesTable,
        companyTable,
        receiptSettingsTable,
        posExtrasTable,
        paymentMethodsTable,
        productCategoriesTable,
        productsTable,
        customersTable,
        screeningsTable,
        screeningVenuesTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('product_categories',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('products', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('screenings',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('screening_venues', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDbHash() => r'6c48ba4bcfc311dbe85fb45b43fb03431b23a071';

/// See also [appDb].
@ProviderFor(appDb)
final appDbProvider = Provider<AppDb>.internal(
  appDb,
  name: r'appDbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDbRef = ProviderRef<AppDb>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

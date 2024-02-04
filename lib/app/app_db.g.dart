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
  late final GeneratedColumnWithTypeConverter<ExtraType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ExtraType>($PosExtrasTableTable.$convertertype);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountTypeMeta =
      const VerificationMeta('amountType');
  @override
  late final GeneratedColumnWithTypeConverter<ExtraAmountType, String>
      amountType = GeneratedColumn<String>('amount_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ExtraAmountType>(
              $PosExtrasTableTable.$converteramountType);
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
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    context.handle(_amountTypeMeta, const VerificationResult.success());
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
      type: $PosExtrasTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      amountType: $PosExtrasTableTable.$converteramountType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}amount_type'])!),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $PosExtrasTableTable createAlias(String alias) {
    return $PosExtrasTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ExtraType, String, String> $convertertype =
      const EnumNameConverter<ExtraType>(ExtraType.values);
  static JsonTypeConverter2<ExtraAmountType, String, String>
      $converteramountType =
      const EnumNameConverter<ExtraAmountType>(ExtraAmountType.values);
}

class PosExtrasTableCompanion extends UpdateCompanion<PosExtra> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<ExtraType> type;
  final Value<double> amount;
  final Value<ExtraAmountType> amountType;
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
    required ExtraType type,
    required double amount,
    required ExtraAmountType amountType,
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
      Value<ExtraType>? type,
      Value<double>? amount,
      Value<ExtraAmountType>? amountType,
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
      map['type'] = Variable<String>(
          $PosExtrasTableTable.$convertertype.toSql(type.value));
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (amountType.present) {
      map['amount_type'] = Variable<String>(
          $PosExtrasTableTable.$converteramountType.toSql(amountType.value));
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
      'screening_form_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
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
    } else if (isInserting) {
      context.missing(_screeningFormIdMeta);
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
          .read(DriftSqlType.int, data['${effectivePrefix}screening_form_id'])!,
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
  final Value<int> screeningFormId;
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
    required int screeningFormId,
  })  : name = Value(name),
        screeningFormId = Value(screeningFormId);
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
      Value<int>? screeningFormId}) {
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

class $ScreeningTimeslotsTableTable extends ScreeningTimeslotsTable
    with TableInfo<$ScreeningTimeslotsTableTable, ScreeningTimeslot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreeningTimeslotsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateAndTimeMeta =
      const VerificationMeta('dateAndTime');
  @override
  late final GeneratedColumn<DateTime> dateAndTime = GeneratedColumn<DateTime>(
      'date_and_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _slotsMeta = const VerificationMeta('slots');
  @override
  late final GeneratedColumn<int> slots = GeneratedColumn<int>(
      'slots', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _specimenCollectionDateMeta =
      const VerificationMeta('specimenCollectionDate');
  @override
  late final GeneratedColumn<DateTime> specimenCollectionDate =
      GeneratedColumn<DateTime>('specimen_collection_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _specimenCollectionTimeMeta =
      const VerificationMeta('specimenCollectionTime');
  @override
  late final GeneratedColumn<String> specimenCollectionTime =
      GeneratedColumn<String>('specimen_collection_time', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _specimenCollectionVenueMeta =
      const VerificationMeta('specimenCollectionVenue');
  @override
  late final GeneratedColumn<String> specimenCollectionVenue =
      GeneratedColumn<String>('specimen_collection_venue', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 999),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _screeningIdMeta =
      const VerificationMeta('screeningId');
  @override
  late final GeneratedColumn<int> screeningId = GeneratedColumn<int>(
      'screening_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES screenings (id) ON DELETE CASCADE'));
  static const VerificationMeta _venueIdMeta =
      const VerificationMeta('venueId');
  @override
  late final GeneratedColumn<int> venueId = GeneratedColumn<int>(
      'venue_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES screening_venues (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        dateAndTime,
        slots,
        specimenCollectionDate,
        specimenCollectionTime,
        specimenCollectionVenue,
        screeningId,
        venueId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screening_timeslots';
  @override
  VerificationContext validateIntegrity(Insertable<ScreeningTimeslot> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_and_time')) {
      context.handle(
          _dateAndTimeMeta,
          dateAndTime.isAcceptableOrUnknown(
              data['date_and_time']!, _dateAndTimeMeta));
    } else if (isInserting) {
      context.missing(_dateAndTimeMeta);
    }
    if (data.containsKey('slots')) {
      context.handle(
          _slotsMeta, slots.isAcceptableOrUnknown(data['slots']!, _slotsMeta));
    } else if (isInserting) {
      context.missing(_slotsMeta);
    }
    if (data.containsKey('specimen_collection_date')) {
      context.handle(
          _specimenCollectionDateMeta,
          specimenCollectionDate.isAcceptableOrUnknown(
              data['specimen_collection_date']!, _specimenCollectionDateMeta));
    }
    if (data.containsKey('specimen_collection_time')) {
      context.handle(
          _specimenCollectionTimeMeta,
          specimenCollectionTime.isAcceptableOrUnknown(
              data['specimen_collection_time']!, _specimenCollectionTimeMeta));
    }
    if (data.containsKey('specimen_collection_venue')) {
      context.handle(
          _specimenCollectionVenueMeta,
          specimenCollectionVenue.isAcceptableOrUnknown(
              data['specimen_collection_venue']!,
              _specimenCollectionVenueMeta));
    }
    if (data.containsKey('screening_id')) {
      context.handle(
          _screeningIdMeta,
          screeningId.isAcceptableOrUnknown(
              data['screening_id']!, _screeningIdMeta));
    } else if (isInserting) {
      context.missing(_screeningIdMeta);
    }
    if (data.containsKey('venue_id')) {
      context.handle(_venueIdMeta,
          venueId.isAcceptableOrUnknown(data['venue_id']!, _venueIdMeta));
    } else if (isInserting) {
      context.missing(_venueIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScreeningTimeslot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreeningTimeslot(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateAndTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_and_time'])!,
      slots: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}slots'])!,
      specimenCollectionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}specimen_collection_date']),
      specimenCollectionTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}specimen_collection_time']),
      specimenCollectionVenue: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}specimen_collection_venue']),
      screeningId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}screening_id'])!,
      venueId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}venue_id'])!,
    );
  }

  @override
  $ScreeningTimeslotsTableTable createAlias(String alias) {
    return $ScreeningTimeslotsTableTable(attachedDatabase, alias);
  }
}

class ScreeningTimeslotsTableCompanion
    extends UpdateCompanion<ScreeningTimeslot> {
  final Value<int> id;
  final Value<DateTime> dateAndTime;
  final Value<int> slots;
  final Value<DateTime?> specimenCollectionDate;
  final Value<String?> specimenCollectionTime;
  final Value<String?> specimenCollectionVenue;
  final Value<int> screeningId;
  final Value<int> venueId;
  const ScreeningTimeslotsTableCompanion({
    this.id = const Value.absent(),
    this.dateAndTime = const Value.absent(),
    this.slots = const Value.absent(),
    this.specimenCollectionDate = const Value.absent(),
    this.specimenCollectionTime = const Value.absent(),
    this.specimenCollectionVenue = const Value.absent(),
    this.screeningId = const Value.absent(),
    this.venueId = const Value.absent(),
  });
  ScreeningTimeslotsTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime dateAndTime,
    required int slots,
    this.specimenCollectionDate = const Value.absent(),
    this.specimenCollectionTime = const Value.absent(),
    this.specimenCollectionVenue = const Value.absent(),
    required int screeningId,
    required int venueId,
  })  : dateAndTime = Value(dateAndTime),
        slots = Value(slots),
        screeningId = Value(screeningId),
        venueId = Value(venueId);
  static Insertable<ScreeningTimeslot> custom({
    Expression<int>? id,
    Expression<DateTime>? dateAndTime,
    Expression<int>? slots,
    Expression<DateTime>? specimenCollectionDate,
    Expression<String>? specimenCollectionTime,
    Expression<String>? specimenCollectionVenue,
    Expression<int>? screeningId,
    Expression<int>? venueId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateAndTime != null) 'date_and_time': dateAndTime,
      if (slots != null) 'slots': slots,
      if (specimenCollectionDate != null)
        'specimen_collection_date': specimenCollectionDate,
      if (specimenCollectionTime != null)
        'specimen_collection_time': specimenCollectionTime,
      if (specimenCollectionVenue != null)
        'specimen_collection_venue': specimenCollectionVenue,
      if (screeningId != null) 'screening_id': screeningId,
      if (venueId != null) 'venue_id': venueId,
    });
  }

  ScreeningTimeslotsTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? dateAndTime,
      Value<int>? slots,
      Value<DateTime?>? specimenCollectionDate,
      Value<String?>? specimenCollectionTime,
      Value<String?>? specimenCollectionVenue,
      Value<int>? screeningId,
      Value<int>? venueId}) {
    return ScreeningTimeslotsTableCompanion(
      id: id ?? this.id,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      slots: slots ?? this.slots,
      specimenCollectionDate:
          specimenCollectionDate ?? this.specimenCollectionDate,
      specimenCollectionTime:
          specimenCollectionTime ?? this.specimenCollectionTime,
      specimenCollectionVenue:
          specimenCollectionVenue ?? this.specimenCollectionVenue,
      screeningId: screeningId ?? this.screeningId,
      venueId: venueId ?? this.venueId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateAndTime.present) {
      map['date_and_time'] = Variable<DateTime>(dateAndTime.value);
    }
    if (slots.present) {
      map['slots'] = Variable<int>(slots.value);
    }
    if (specimenCollectionDate.present) {
      map['specimen_collection_date'] =
          Variable<DateTime>(specimenCollectionDate.value);
    }
    if (specimenCollectionTime.present) {
      map['specimen_collection_time'] =
          Variable<String>(specimenCollectionTime.value);
    }
    if (specimenCollectionVenue.present) {
      map['specimen_collection_venue'] =
          Variable<String>(specimenCollectionVenue.value);
    }
    if (screeningId.present) {
      map['screening_id'] = Variable<int>(screeningId.value);
    }
    if (venueId.present) {
      map['venue_id'] = Variable<int>(venueId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreeningTimeslotsTableCompanion(')
          ..write('id: $id, ')
          ..write('dateAndTime: $dateAndTime, ')
          ..write('slots: $slots, ')
          ..write('specimenCollectionDate: $specimenCollectionDate, ')
          ..write('specimenCollectionTime: $specimenCollectionTime, ')
          ..write('specimenCollectionVenue: $specimenCollectionVenue, ')
          ..write('screeningId: $screeningId, ')
          ..write('venueId: $venueId')
          ..write(')'))
        .toString();
  }
}

class $ScreeningRegistrationsTableTable extends ScreeningRegistrationsTable
    with TableInfo<$ScreeningRegistrationsTableTable, ScreeningRegistration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreeningRegistrationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<String> index = GeneratedColumn<String>(
      'index', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES customers (id) ON DELETE CASCADE'));
  static const VerificationMeta _timeslotIdMeta =
      const VerificationMeta('timeslotId');
  @override
  late final GeneratedColumn<int> timeslotId = GeneratedColumn<int>(
      'timeslot_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES screening_timeslots (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [index, customerId, timeslotId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screening_registrations';
  @override
  VerificationContext validateIntegrity(
      Insertable<ScreeningRegistration> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('timeslot_id')) {
      context.handle(
          _timeslotIdMeta,
          timeslotId.isAcceptableOrUnknown(
              data['timeslot_id']!, _timeslotIdMeta));
    } else if (isInserting) {
      context.missing(_timeslotIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ScreeningRegistration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreeningRegistration(
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}index']),
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      timeslotId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timeslot_id'])!,
    );
  }

  @override
  $ScreeningRegistrationsTableTable createAlias(String alias) {
    return $ScreeningRegistrationsTableTable(attachedDatabase, alias);
  }
}

class ScreeningRegistrationsTableCompanion
    extends UpdateCompanion<ScreeningRegistration> {
  final Value<String?> index;
  final Value<int> customerId;
  final Value<int> timeslotId;
  final Value<int> rowid;
  const ScreeningRegistrationsTableCompanion({
    this.index = const Value.absent(),
    this.customerId = const Value.absent(),
    this.timeslotId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScreeningRegistrationsTableCompanion.insert({
    this.index = const Value.absent(),
    required int customerId,
    required int timeslotId,
    this.rowid = const Value.absent(),
  })  : customerId = Value(customerId),
        timeslotId = Value(timeslotId);
  static Insertable<ScreeningRegistration> custom({
    Expression<String>? index,
    Expression<int>? customerId,
    Expression<int>? timeslotId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (index != null) 'index': index,
      if (customerId != null) 'customer_id': customerId,
      if (timeslotId != null) 'timeslot_id': timeslotId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScreeningRegistrationsTableCompanion copyWith(
      {Value<String?>? index,
      Value<int>? customerId,
      Value<int>? timeslotId,
      Value<int>? rowid}) {
    return ScreeningRegistrationsTableCompanion(
      index: index ?? this.index,
      customerId: customerId ?? this.customerId,
      timeslotId: timeslotId ?? this.timeslotId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (index.present) {
      map['index'] = Variable<String>(index.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (timeslotId.present) {
      map['timeslot_id'] = Variable<int>(timeslotId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreeningRegistrationsTableCompanion(')
          ..write('index: $index, ')
          ..write('customerId: $customerId, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrdersTableTable extends OrdersTable
    with TableInfo<$OrdersTableTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isStfMeta = const VerificationMeta('isStf');
  @override
  late final GeneratedColumn<bool> isStf = GeneratedColumn<bool>(
      'is_stf', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_stf" IN (0, 1))'));
  static const VerificationMeta _isUtfMeta = const VerificationMeta('isUtf');
  @override
  late final GeneratedColumn<bool> isUtf = GeneratedColumn<bool>(
      'is_utf', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_utf" IN (0, 1))'));
  static const VerificationMeta _salesNoteMeta =
      const VerificationMeta('salesNote');
  @override
  late final GeneratedColumn<String> salesNote = GeneratedColumn<String>(
      'sales_note', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _invoiceNoMeta =
      const VerificationMeta('invoiceNo');
  @override
  late final GeneratedColumn<String> invoiceNo = GeneratedColumn<String>(
      'invoice_no', aliasedName, false,
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
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumnWithTypeConverter<DiscountType?, String>
      discountType = GeneratedColumn<String>('discount_type', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<DiscountType?>(
              $OrdersTableTable.$converterdiscountTypen);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _extrasTotalMeta =
      const VerificationMeta('extrasTotal');
  @override
  late final GeneratedColumn<double> extrasTotal = GeneratedColumn<double>(
      'extras_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netTotalMeta =
      const VerificationMeta('netTotal');
  @override
  late final GeneratedColumn<double> netTotal = GeneratedColumn<double>(
      'net_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _roundingMeta =
      const VerificationMeta('rounding');
  @override
  late final GeneratedColumn<double> rounding = GeneratedColumn<double>(
      'rounding', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _licenseIdMeta =
      const VerificationMeta('licenseId');
  @override
  late final GeneratedColumn<int> licenseId = GeneratedColumn<int>(
      'license_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _screeningIdMeta =
      const VerificationMeta('screeningId');
  @override
  late final GeneratedColumn<int> screeningId = GeneratedColumn<int>(
      'screening_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES screenings (id) ON DELETE CASCADE'));
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES customers (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        isStf,
        isUtf,
        salesNote,
        invoiceNo,
        invoicePrefix,
        discount,
        discountType,
        subtotal,
        extrasTotal,
        netTotal,
        rounding,
        licenseId,
        screeningId,
        customerId,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_stf')) {
      context.handle(
          _isStfMeta, isStf.isAcceptableOrUnknown(data['is_stf']!, _isStfMeta));
    } else if (isInserting) {
      context.missing(_isStfMeta);
    }
    if (data.containsKey('is_utf')) {
      context.handle(
          _isUtfMeta, isUtf.isAcceptableOrUnknown(data['is_utf']!, _isUtfMeta));
    } else if (isInserting) {
      context.missing(_isUtfMeta);
    }
    if (data.containsKey('sales_note')) {
      context.handle(_salesNoteMeta,
          salesNote.isAcceptableOrUnknown(data['sales_note']!, _salesNoteMeta));
    }
    if (data.containsKey('invoice_no')) {
      context.handle(_invoiceNoMeta,
          invoiceNo.isAcceptableOrUnknown(data['invoice_no']!, _invoiceNoMeta));
    } else if (isInserting) {
      context.missing(_invoiceNoMeta);
    }
    if (data.containsKey('invoice_prefix')) {
      context.handle(
          _invoicePrefixMeta,
          invoicePrefix.isAcceptableOrUnknown(
              data['invoice_prefix']!, _invoicePrefixMeta));
    } else if (isInserting) {
      context.missing(_invoicePrefixMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    context.handle(_discountTypeMeta, const VerificationResult.success());
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('extras_total')) {
      context.handle(
          _extrasTotalMeta,
          extrasTotal.isAcceptableOrUnknown(
              data['extras_total']!, _extrasTotalMeta));
    } else if (isInserting) {
      context.missing(_extrasTotalMeta);
    }
    if (data.containsKey('net_total')) {
      context.handle(_netTotalMeta,
          netTotal.isAcceptableOrUnknown(data['net_total']!, _netTotalMeta));
    } else if (isInserting) {
      context.missing(_netTotalMeta);
    }
    if (data.containsKey('rounding')) {
      context.handle(_roundingMeta,
          rounding.isAcceptableOrUnknown(data['rounding']!, _roundingMeta));
    }
    if (data.containsKey('license_id')) {
      context.handle(_licenseIdMeta,
          licenseId.isAcceptableOrUnknown(data['license_id']!, _licenseIdMeta));
    } else if (isInserting) {
      context.missing(_licenseIdMeta);
    }
    if (data.containsKey('screening_id')) {
      context.handle(
          _screeningIdMeta,
          screeningId.isAcceptableOrUnknown(
              data['screening_id']!, _screeningIdMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isStf: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_stf'])!,
      isUtf: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_utf'])!,
      salesNote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sales_note']),
      invoiceNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_no'])!,
      invoicePrefix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_prefix'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount']),
      discountType: $OrdersTableTable.$converterdiscountTypen.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}discount_type'])),
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      extrasTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}extras_total'])!,
      netTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_total'])!,
      rounding: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rounding']),
      licenseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}license_id'])!,
      screeningId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}screening_id']),
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OrdersTableTable createAlias(String alias) {
    return $OrdersTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DiscountType, String, String>
      $converterdiscountType =
      const EnumNameConverter<DiscountType>(DiscountType.values);
  static JsonTypeConverter2<DiscountType?, String?, String?>
      $converterdiscountTypen =
      JsonTypeConverter2.asNullable($converterdiscountType);
}

class OrdersTableCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<bool> isStf;
  final Value<bool> isUtf;
  final Value<String?> salesNote;
  final Value<String> invoiceNo;
  final Value<String> invoicePrefix;
  final Value<double?> discount;
  final Value<DiscountType?> discountType;
  final Value<double> subtotal;
  final Value<double> extrasTotal;
  final Value<double> netTotal;
  final Value<double?> rounding;
  final Value<int> licenseId;
  final Value<int?> screeningId;
  final Value<int> customerId;
  final Value<DateTime> createdAt;
  const OrdersTableCompanion({
    this.id = const Value.absent(),
    this.isStf = const Value.absent(),
    this.isUtf = const Value.absent(),
    this.salesNote = const Value.absent(),
    this.invoiceNo = const Value.absent(),
    this.invoicePrefix = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.extrasTotal = const Value.absent(),
    this.netTotal = const Value.absent(),
    this.rounding = const Value.absent(),
    this.licenseId = const Value.absent(),
    this.screeningId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrdersTableCompanion.insert({
    this.id = const Value.absent(),
    required bool isStf,
    required bool isUtf,
    this.salesNote = const Value.absent(),
    required String invoiceNo,
    required String invoicePrefix,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    required double subtotal,
    required double extrasTotal,
    required double netTotal,
    this.rounding = const Value.absent(),
    required int licenseId,
    this.screeningId = const Value.absent(),
    required int customerId,
    required DateTime createdAt,
  })  : isStf = Value(isStf),
        isUtf = Value(isUtf),
        invoiceNo = Value(invoiceNo),
        invoicePrefix = Value(invoicePrefix),
        subtotal = Value(subtotal),
        extrasTotal = Value(extrasTotal),
        netTotal = Value(netTotal),
        licenseId = Value(licenseId),
        customerId = Value(customerId),
        createdAt = Value(createdAt);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<bool>? isStf,
    Expression<bool>? isUtf,
    Expression<String>? salesNote,
    Expression<String>? invoiceNo,
    Expression<String>? invoicePrefix,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? subtotal,
    Expression<double>? extrasTotal,
    Expression<double>? netTotal,
    Expression<double>? rounding,
    Expression<int>? licenseId,
    Expression<int>? screeningId,
    Expression<int>? customerId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isStf != null) 'is_stf': isStf,
      if (isUtf != null) 'is_utf': isUtf,
      if (salesNote != null) 'sales_note': salesNote,
      if (invoiceNo != null) 'invoice_no': invoiceNo,
      if (invoicePrefix != null) 'invoice_prefix': invoicePrefix,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (subtotal != null) 'subtotal': subtotal,
      if (extrasTotal != null) 'extras_total': extrasTotal,
      if (netTotal != null) 'net_total': netTotal,
      if (rounding != null) 'rounding': rounding,
      if (licenseId != null) 'license_id': licenseId,
      if (screeningId != null) 'screening_id': screeningId,
      if (customerId != null) 'customer_id': customerId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrdersTableCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isStf,
      Value<bool>? isUtf,
      Value<String?>? salesNote,
      Value<String>? invoiceNo,
      Value<String>? invoicePrefix,
      Value<double?>? discount,
      Value<DiscountType?>? discountType,
      Value<double>? subtotal,
      Value<double>? extrasTotal,
      Value<double>? netTotal,
      Value<double?>? rounding,
      Value<int>? licenseId,
      Value<int?>? screeningId,
      Value<int>? customerId,
      Value<DateTime>? createdAt}) {
    return OrdersTableCompanion(
      id: id ?? this.id,
      isStf: isStf ?? this.isStf,
      isUtf: isUtf ?? this.isUtf,
      salesNote: salesNote ?? this.salesNote,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      invoicePrefix: invoicePrefix ?? this.invoicePrefix,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      subtotal: subtotal ?? this.subtotal,
      extrasTotal: extrasTotal ?? this.extrasTotal,
      netTotal: netTotal ?? this.netTotal,
      rounding: rounding ?? this.rounding,
      licenseId: licenseId ?? this.licenseId,
      screeningId: screeningId ?? this.screeningId,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isStf.present) {
      map['is_stf'] = Variable<bool>(isStf.value);
    }
    if (isUtf.present) {
      map['is_utf'] = Variable<bool>(isUtf.value);
    }
    if (salesNote.present) {
      map['sales_note'] = Variable<String>(salesNote.value);
    }
    if (invoiceNo.present) {
      map['invoice_no'] = Variable<String>(invoiceNo.value);
    }
    if (invoicePrefix.present) {
      map['invoice_prefix'] = Variable<String>(invoicePrefix.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(
          $OrdersTableTable.$converterdiscountTypen.toSql(discountType.value));
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (extrasTotal.present) {
      map['extras_total'] = Variable<double>(extrasTotal.value);
    }
    if (netTotal.present) {
      map['net_total'] = Variable<double>(netTotal.value);
    }
    if (rounding.present) {
      map['rounding'] = Variable<double>(rounding.value);
    }
    if (licenseId.present) {
      map['license_id'] = Variable<int>(licenseId.value);
    }
    if (screeningId.present) {
      map['screening_id'] = Variable<int>(screeningId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableCompanion(')
          ..write('id: $id, ')
          ..write('isStf: $isStf, ')
          ..write('isUtf: $isUtf, ')
          ..write('salesNote: $salesNote, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('invoicePrefix: $invoicePrefix, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('subtotal: $subtotal, ')
          ..write('extrasTotal: $extrasTotal, ')
          ..write('netTotal: $netTotal, ')
          ..write('rounding: $rounding, ')
          ..write('licenseId: $licenseId, ')
          ..write('screeningId: $screeningId, ')
          ..write('customerId: $customerId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTableTable extends OrderItemsTable
    with TableInfo<$OrderItemsTableTable, OrderItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _netPriceMeta =
      const VerificationMeta('netPrice');
  @override
  late final GeneratedColumn<double> netPrice = GeneratedColumn<double>(
      'net_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isCustomMeta =
      const VerificationMeta('isCustom');
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
      'is_custom', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_custom" IN (0, 1))'));
  static const VerificationMeta _cartIdMeta = const VerificationMeta('cartId');
  @override
  late final GeneratedColumn<int> cartId = GeneratedColumn<int>(
      'cart_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES products (id) ON DELETE SET NULL'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES orders (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        sku,
        description,
        price,
        discount,
        discountType,
        netPrice,
        isCustom,
        cartId,
        productId,
        orderId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItem> instance,
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    }
    if (data.containsKey('net_price')) {
      context.handle(_netPriceMeta,
          netPrice.isAcceptableOrUnknown(data['net_price']!, _netPriceMeta));
    } else if (isInserting) {
      context.missing(_netPriceMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(_isCustomMeta,
          isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta));
    } else if (isInserting) {
      context.missing(_isCustomMeta);
    }
    if (data.containsKey('cart_id')) {
      context.handle(_cartIdMeta,
          cartId.isAcceptableOrUnknown(data['cart_id']!, _cartIdMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount']),
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type']),
      netPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_price'])!,
      isCustom: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_custom'])!,
      cartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cart_id']),
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
    );
  }

  @override
  $OrderItemsTableTable createAlias(String alias) {
    return $OrderItemsTableTable(attachedDatabase, alias);
  }
}

class OrderItemsTableCompanion extends UpdateCompanion<OrderItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> sku;
  final Value<String?> description;
  final Value<double> price;
  final Value<double?> discount;
  final Value<String?> discountType;
  final Value<double> netPrice;
  final Value<bool> isCustom;
  final Value<int?> cartId;
  final Value<int?> productId;
  final Value<int> orderId;
  const OrderItemsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.netPrice = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.cartId = const Value.absent(),
    this.productId = const Value.absent(),
    this.orderId = const Value.absent(),
  });
  OrderItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String sku,
    this.description = const Value.absent(),
    required double price,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    required double netPrice,
    required bool isCustom,
    this.cartId = const Value.absent(),
    this.productId = const Value.absent(),
    required int orderId,
  })  : name = Value(name),
        sku = Value(sku),
        price = Value(price),
        netPrice = Value(netPrice),
        isCustom = Value(isCustom),
        orderId = Value(orderId);
  static Insertable<OrderItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<String>? description,
    Expression<double>? price,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? netPrice,
    Expression<bool>? isCustom,
    Expression<int>? cartId,
    Expression<int>? productId,
    Expression<int>? orderId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (netPrice != null) 'net_price': netPrice,
      if (isCustom != null) 'is_custom': isCustom,
      if (cartId != null) 'cart_id': cartId,
      if (productId != null) 'product_id': productId,
      if (orderId != null) 'order_id': orderId,
    });
  }

  OrderItemsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? sku,
      Value<String?>? description,
      Value<double>? price,
      Value<double?>? discount,
      Value<String?>? discountType,
      Value<double>? netPrice,
      Value<bool>? isCustom,
      Value<int?>? cartId,
      Value<int?>? productId,
      Value<int>? orderId}) {
    return OrderItemsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      description: description ?? this.description,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      netPrice: netPrice ?? this.netPrice,
      isCustom: isCustom ?? this.isCustom,
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      orderId: orderId ?? this.orderId,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (netPrice.present) {
      map['net_price'] = Variable<double>(netPrice.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (cartId.present) {
      map['cart_id'] = Variable<int>(cartId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('netPrice: $netPrice, ')
          ..write('isCustom: $isCustom, ')
          ..write('cartId: $cartId, ')
          ..write('productId: $productId, ')
          ..write('orderId: $orderId')
          ..write(')'))
        .toString();
  }
}

class $OrderExtrasTableTable extends OrderExtrasTable
    with TableInfo<$OrderExtrasTableTable, OrderExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderExtrasTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ExtraType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ExtraType>($OrderExtrasTableTable.$convertertype);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountTypeMeta =
      const VerificationMeta('amountType');
  @override
  late final GeneratedColumnWithTypeConverter<ExtraAmountType, String>
      amountType = GeneratedColumn<String>('amount_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ExtraAmountType>(
              $OrderExtrasTableTable.$converteramountType);
  static const VerificationMeta _calculatedAmountMeta =
      const VerificationMeta('calculatedAmount');
  @override
  late final GeneratedColumn<double> calculatedAmount = GeneratedColumn<double>(
      'calculated_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _extraIdMeta =
      const VerificationMeta('extraId');
  @override
  late final GeneratedColumn<int> extraId = GeneratedColumn<int>(
      'extra_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pos_extras (id) ON DELETE SET NULL'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES orders (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        description,
        amount,
        amountType,
        calculatedAmount,
        extraId,
        orderId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_extras';
  @override
  VerificationContext validateIntegrity(Insertable<OrderExtra> instance,
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
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    context.handle(_amountTypeMeta, const VerificationResult.success());
    if (data.containsKey('calculated_amount')) {
      context.handle(
          _calculatedAmountMeta,
          calculatedAmount.isAcceptableOrUnknown(
              data['calculated_amount']!, _calculatedAmountMeta));
    } else if (isInserting) {
      context.missing(_calculatedAmountMeta);
    }
    if (data.containsKey('extra_id')) {
      context.handle(_extraIdMeta,
          extraId.isAcceptableOrUnknown(data['extra_id']!, _extraIdMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $OrderExtrasTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      amountType: $OrderExtrasTableTable.$converteramountType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}amount_type'])!),
      calculatedAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}calculated_amount'])!,
      extraId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}extra_id']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
    );
  }

  @override
  $OrderExtrasTableTable createAlias(String alias) {
    return $OrderExtrasTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ExtraType, String, String> $convertertype =
      const EnumNameConverter<ExtraType>(ExtraType.values);
  static JsonTypeConverter2<ExtraAmountType, String, String>
      $converteramountType =
      const EnumNameConverter<ExtraAmountType>(ExtraAmountType.values);
}

class OrderExtrasTableCompanion extends UpdateCompanion<OrderExtra> {
  final Value<int> id;
  final Value<String> name;
  final Value<ExtraType> type;
  final Value<String?> description;
  final Value<double> amount;
  final Value<ExtraAmountType> amountType;
  final Value<double> calculatedAmount;
  final Value<int?> extraId;
  final Value<int> orderId;
  const OrderExtrasTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.amountType = const Value.absent(),
    this.calculatedAmount = const Value.absent(),
    this.extraId = const Value.absent(),
    this.orderId = const Value.absent(),
  });
  OrderExtrasTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required ExtraType type,
    this.description = const Value.absent(),
    required double amount,
    required ExtraAmountType amountType,
    required double calculatedAmount,
    this.extraId = const Value.absent(),
    required int orderId,
  })  : name = Value(name),
        type = Value(type),
        amount = Value(amount),
        amountType = Value(amountType),
        calculatedAmount = Value(calculatedAmount),
        orderId = Value(orderId);
  static Insertable<OrderExtra> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<String>? amountType,
    Expression<double>? calculatedAmount,
    Expression<int>? extraId,
    Expression<int>? orderId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (amountType != null) 'amount_type': amountType,
      if (calculatedAmount != null) 'calculated_amount': calculatedAmount,
      if (extraId != null) 'extra_id': extraId,
      if (orderId != null) 'order_id': orderId,
    });
  }

  OrderExtrasTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<ExtraType>? type,
      Value<String?>? description,
      Value<double>? amount,
      Value<ExtraAmountType>? amountType,
      Value<double>? calculatedAmount,
      Value<int?>? extraId,
      Value<int>? orderId}) {
    return OrderExtrasTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      amountType: amountType ?? this.amountType,
      calculatedAmount: calculatedAmount ?? this.calculatedAmount,
      extraId: extraId ?? this.extraId,
      orderId: orderId ?? this.orderId,
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
    if (type.present) {
      map['type'] = Variable<String>(
          $OrderExtrasTableTable.$convertertype.toSql(type.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (amountType.present) {
      map['amount_type'] = Variable<String>(
          $OrderExtrasTableTable.$converteramountType.toSql(amountType.value));
    }
    if (calculatedAmount.present) {
      map['calculated_amount'] = Variable<double>(calculatedAmount.value);
    }
    if (extraId.present) {
      map['extra_id'] = Variable<int>(extraId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderExtrasTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('amountType: $amountType, ')
          ..write('calculatedAmount: $calculatedAmount, ')
          ..write('extraId: $extraId, ')
          ..write('orderId: $orderId')
          ..write(')'))
        .toString();
  }
}

class $OrderPaymentsTableTable extends OrderPaymentsTable
    with TableInfo<$OrderPaymentsTableTable, OrderPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderPaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES orders (id) ON DELETE CASCADE'));
  static const VerificationMeta _paymentMethodIdMeta =
      const VerificationMeta('paymentMethodId');
  @override
  late final GeneratedColumn<int> paymentMethodId = GeneratedColumn<int>(
      'payment_method_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES payment_methods (id) ON DELETE SET NULL'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, orderId, paymentMethodId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_payments';
  @override
  VerificationContext validateIntegrity(Insertable<OrderPayment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('payment_method_id')) {
      context.handle(
          _paymentMethodIdMeta,
          paymentMethodId.isAcceptableOrUnknown(
              data['payment_method_id']!, _paymentMethodIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderPayment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      paymentMethodId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_method_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OrderPaymentsTableTable createAlias(String alias) {
    return $OrderPaymentsTableTable(attachedDatabase, alias);
  }
}

class OrderPaymentsTableCompanion extends UpdateCompanion<OrderPayment> {
  final Value<int> id;
  final Value<double> amount;
  final Value<int> orderId;
  final Value<int?> paymentMethodId;
  final Value<DateTime> createdAt;
  const OrderPaymentsTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.orderId = const Value.absent(),
    this.paymentMethodId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrderPaymentsTableCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required int orderId,
    this.paymentMethodId = const Value.absent(),
    required DateTime createdAt,
  })  : amount = Value(amount),
        orderId = Value(orderId),
        createdAt = Value(createdAt);
  static Insertable<OrderPayment> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<int>? orderId,
    Expression<int>? paymentMethodId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (orderId != null) 'order_id': orderId,
      if (paymentMethodId != null) 'payment_method_id': paymentMethodId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrderPaymentsTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<int>? orderId,
      Value<int?>? paymentMethodId,
      Value<DateTime>? createdAt}) {
    return OrderPaymentsTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      orderId: orderId ?? this.orderId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (paymentMethodId.present) {
      map['payment_method_id'] = Variable<int>(paymentMethodId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderPaymentsTableCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('orderId: $orderId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NewCustomersTableTable extends NewCustomersTable
    with TableInfo<$NewCustomersTableTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewCustomersTableTable(this.attachedDatabase, [this._alias]);
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
      'nric', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
  static const VerificationMeta _sendAccountInvitationMeta =
      const VerificationMeta('sendAccountInvitation');
  @override
  late final GeneratedColumn<bool> sendAccountInvitation =
      GeneratedColumn<bool>('send_account_invitation', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("send_account_invitation" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fullName,
        nric,
        dob,
        gender,
        email,
        mobileNo,
        sendAccountInvitation,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'new_customers';
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
    } else if (isInserting) {
      context.missing(_nricMeta);
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
    if (data.containsKey('send_account_invitation')) {
      context.handle(
          _sendAccountInvitationMeta,
          sendAccountInvitation.isAcceptableOrUnknown(
              data['send_account_invitation']!, _sendAccountInvitationMeta));
    } else if (isInserting) {
      context.missing(_sendAccountInvitationMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}nric'])!,
      dob: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dob']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      mobileNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mobile_no']),
      sendAccountInvitation: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}send_account_invitation'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NewCustomersTableTable createAlias(String alias) {
    return $NewCustomersTableTable(attachedDatabase, alias);
  }
}

class NewCustomersTableCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> nric;
  final Value<DateTime?> dob;
  final Value<String?> gender;
  final Value<String?> email;
  final Value<String?> mobileNo;
  final Value<bool> sendAccountInvitation;
  final Value<DateTime> createdAt;
  const NewCustomersTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nric = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.email = const Value.absent(),
    this.mobileNo = const Value.absent(),
    this.sendAccountInvitation = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NewCustomersTableCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String nric,
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.email = const Value.absent(),
    this.mobileNo = const Value.absent(),
    required bool sendAccountInvitation,
    required DateTime createdAt,
  })  : fullName = Value(fullName),
        nric = Value(nric),
        sendAccountInvitation = Value(sendAccountInvitation),
        createdAt = Value(createdAt);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? nric,
    Expression<DateTime>? dob,
    Expression<String>? gender,
    Expression<String>? email,
    Expression<String>? mobileNo,
    Expression<bool>? sendAccountInvitation,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (nric != null) 'nric': nric,
      if (dob != null) 'dob': dob,
      if (gender != null) 'gender': gender,
      if (email != null) 'email': email,
      if (mobileNo != null) 'mobile_no': mobileNo,
      if (sendAccountInvitation != null)
        'send_account_invitation': sendAccountInvitation,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NewCustomersTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String>? nric,
      Value<DateTime?>? dob,
      Value<String?>? gender,
      Value<String?>? email,
      Value<String?>? mobileNo,
      Value<bool>? sendAccountInvitation,
      Value<DateTime>? createdAt}) {
    return NewCustomersTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      nric: nric ?? this.nric,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      mobileNo: mobileNo ?? this.mobileNo,
      sendAccountInvitation:
          sendAccountInvitation ?? this.sendAccountInvitation,
      createdAt: createdAt ?? this.createdAt,
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
    if (sendAccountInvitation.present) {
      map['send_account_invitation'] =
          Variable<bool>(sendAccountInvitation.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewCustomersTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('nric: $nric, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('email: $email, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('sendAccountInvitation: $sendAccountInvitation, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NewOrderExtrasTableTable extends NewOrderExtrasTable
    with TableInfo<$NewOrderExtrasTableTable, OrderExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewOrderExtrasTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ExtraType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ExtraType>($NewOrderExtrasTableTable.$convertertype);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountTypeMeta =
      const VerificationMeta('amountType');
  @override
  late final GeneratedColumnWithTypeConverter<ExtraAmountType, String>
      amountType = GeneratedColumn<String>('amount_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ExtraAmountType>(
              $NewOrderExtrasTableTable.$converteramountType);
  static const VerificationMeta _calculatedAmountMeta =
      const VerificationMeta('calculatedAmount');
  @override
  late final GeneratedColumn<double> calculatedAmount = GeneratedColumn<double>(
      'calculated_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _extraIdMeta =
      const VerificationMeta('extraId');
  @override
  late final GeneratedColumn<int> extraId = GeneratedColumn<int>(
      'extra_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pos_extras (id) ON DELETE SET NULL'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES orders (id) ON DELETE CASCADE'));
  static const VerificationMeta _orderIsNewMeta =
      const VerificationMeta('orderIsNew');
  @override
  late final GeneratedColumn<bool> orderIsNew = GeneratedColumn<bool>(
      'order_is_new', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("order_is_new" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        description,
        amount,
        amountType,
        calculatedAmount,
        extraId,
        orderId,
        orderIsNew,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'new_order_extras';
  @override
  VerificationContext validateIntegrity(Insertable<OrderExtra> instance,
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
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    context.handle(_amountTypeMeta, const VerificationResult.success());
    if (data.containsKey('calculated_amount')) {
      context.handle(
          _calculatedAmountMeta,
          calculatedAmount.isAcceptableOrUnknown(
              data['calculated_amount']!, _calculatedAmountMeta));
    } else if (isInserting) {
      context.missing(_calculatedAmountMeta);
    }
    if (data.containsKey('extra_id')) {
      context.handle(_extraIdMeta,
          extraId.isAcceptableOrUnknown(data['extra_id']!, _extraIdMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('order_is_new')) {
      context.handle(
          _orderIsNewMeta,
          orderIsNew.isAcceptableOrUnknown(
              data['order_is_new']!, _orderIsNewMeta));
    } else if (isInserting) {
      context.missing(_orderIsNewMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $NewOrderExtrasTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      amountType: $NewOrderExtrasTableTable.$converteramountType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}amount_type'])!),
      calculatedAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}calculated_amount'])!,
      extraId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}extra_id']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      orderIsNew: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}order_is_new'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NewOrderExtrasTableTable createAlias(String alias) {
    return $NewOrderExtrasTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ExtraType, String, String> $convertertype =
      const EnumNameConverter<ExtraType>(ExtraType.values);
  static JsonTypeConverter2<ExtraAmountType, String, String>
      $converteramountType =
      const EnumNameConverter<ExtraAmountType>(ExtraAmountType.values);
}

class NewOrderExtrasTableCompanion extends UpdateCompanion<OrderExtra> {
  final Value<int> id;
  final Value<String> name;
  final Value<ExtraType> type;
  final Value<String?> description;
  final Value<double> amount;
  final Value<ExtraAmountType> amountType;
  final Value<double> calculatedAmount;
  final Value<int?> extraId;
  final Value<int> orderId;
  final Value<bool> orderIsNew;
  final Value<DateTime> createdAt;
  const NewOrderExtrasTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.amountType = const Value.absent(),
    this.calculatedAmount = const Value.absent(),
    this.extraId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.orderIsNew = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NewOrderExtrasTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required ExtraType type,
    this.description = const Value.absent(),
    required double amount,
    required ExtraAmountType amountType,
    required double calculatedAmount,
    this.extraId = const Value.absent(),
    required int orderId,
    required bool orderIsNew,
    required DateTime createdAt,
  })  : name = Value(name),
        type = Value(type),
        amount = Value(amount),
        amountType = Value(amountType),
        calculatedAmount = Value(calculatedAmount),
        orderId = Value(orderId),
        orderIsNew = Value(orderIsNew),
        createdAt = Value(createdAt);
  static Insertable<OrderExtra> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<String>? amountType,
    Expression<double>? calculatedAmount,
    Expression<int>? extraId,
    Expression<int>? orderId,
    Expression<bool>? orderIsNew,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (amountType != null) 'amount_type': amountType,
      if (calculatedAmount != null) 'calculated_amount': calculatedAmount,
      if (extraId != null) 'extra_id': extraId,
      if (orderId != null) 'order_id': orderId,
      if (orderIsNew != null) 'order_is_new': orderIsNew,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NewOrderExtrasTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<ExtraType>? type,
      Value<String?>? description,
      Value<double>? amount,
      Value<ExtraAmountType>? amountType,
      Value<double>? calculatedAmount,
      Value<int?>? extraId,
      Value<int>? orderId,
      Value<bool>? orderIsNew,
      Value<DateTime>? createdAt}) {
    return NewOrderExtrasTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      amountType: amountType ?? this.amountType,
      calculatedAmount: calculatedAmount ?? this.calculatedAmount,
      extraId: extraId ?? this.extraId,
      orderId: orderId ?? this.orderId,
      orderIsNew: orderIsNew ?? this.orderIsNew,
      createdAt: createdAt ?? this.createdAt,
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
    if (type.present) {
      map['type'] = Variable<String>(
          $NewOrderExtrasTableTable.$convertertype.toSql(type.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (amountType.present) {
      map['amount_type'] = Variable<String>($NewOrderExtrasTableTable
          .$converteramountType
          .toSql(amountType.value));
    }
    if (calculatedAmount.present) {
      map['calculated_amount'] = Variable<double>(calculatedAmount.value);
    }
    if (extraId.present) {
      map['extra_id'] = Variable<int>(extraId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (orderIsNew.present) {
      map['order_is_new'] = Variable<bool>(orderIsNew.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewOrderExtrasTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('amountType: $amountType, ')
          ..write('calculatedAmount: $calculatedAmount, ')
          ..write('extraId: $extraId, ')
          ..write('orderId: $orderId, ')
          ..write('orderIsNew: $orderIsNew, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NewOrderItemsTableTable extends NewOrderItemsTable
    with TableInfo<$NewOrderItemsTableTable, OrderItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewOrderItemsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _netPriceMeta =
      const VerificationMeta('netPrice');
  @override
  late final GeneratedColumn<double> netPrice = GeneratedColumn<double>(
      'net_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isCustomMeta =
      const VerificationMeta('isCustom');
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
      'is_custom', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_custom" IN (0, 1))'));
  static const VerificationMeta _orderIsNewMeta =
      const VerificationMeta('orderIsNew');
  @override
  late final GeneratedColumn<bool> orderIsNew = GeneratedColumn<bool>(
      'order_is_new', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("order_is_new" IN (0, 1))'));
  static const VerificationMeta _cartIdMeta = const VerificationMeta('cartId');
  @override
  late final GeneratedColumn<int> cartId = GeneratedColumn<int>(
      'cart_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES products (id) ON DELETE SET NULL'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES orders (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        sku,
        description,
        price,
        discount,
        discountType,
        netPrice,
        isCustom,
        orderIsNew,
        cartId,
        productId,
        orderId,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'new_order_items';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItem> instance,
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    }
    if (data.containsKey('net_price')) {
      context.handle(_netPriceMeta,
          netPrice.isAcceptableOrUnknown(data['net_price']!, _netPriceMeta));
    } else if (isInserting) {
      context.missing(_netPriceMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(_isCustomMeta,
          isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta));
    } else if (isInserting) {
      context.missing(_isCustomMeta);
    }
    if (data.containsKey('order_is_new')) {
      context.handle(
          _orderIsNewMeta,
          orderIsNew.isAcceptableOrUnknown(
              data['order_is_new']!, _orderIsNewMeta));
    } else if (isInserting) {
      context.missing(_orderIsNewMeta);
    }
    if (data.containsKey('cart_id')) {
      context.handle(_cartIdMeta,
          cartId.isAcceptableOrUnknown(data['cart_id']!, _cartIdMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount']),
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type']),
      netPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_price'])!,
      isCustom: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_custom'])!,
      orderIsNew: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}order_is_new'])!,
      cartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cart_id']),
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NewOrderItemsTableTable createAlias(String alias) {
    return $NewOrderItemsTableTable(attachedDatabase, alias);
  }
}

class NewOrderItemsTableCompanion extends UpdateCompanion<OrderItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> sku;
  final Value<String?> description;
  final Value<double> price;
  final Value<double?> discount;
  final Value<String?> discountType;
  final Value<double> netPrice;
  final Value<bool> isCustom;
  final Value<bool> orderIsNew;
  final Value<int?> cartId;
  final Value<int?> productId;
  final Value<int> orderId;
  final Value<DateTime> createdAt;
  const NewOrderItemsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.netPrice = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.orderIsNew = const Value.absent(),
    this.cartId = const Value.absent(),
    this.productId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NewOrderItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String sku,
    this.description = const Value.absent(),
    required double price,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    required double netPrice,
    required bool isCustom,
    required bool orderIsNew,
    this.cartId = const Value.absent(),
    this.productId = const Value.absent(),
    required int orderId,
    required DateTime createdAt,
  })  : name = Value(name),
        sku = Value(sku),
        price = Value(price),
        netPrice = Value(netPrice),
        isCustom = Value(isCustom),
        orderIsNew = Value(orderIsNew),
        orderId = Value(orderId),
        createdAt = Value(createdAt);
  static Insertable<OrderItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<String>? description,
    Expression<double>? price,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? netPrice,
    Expression<bool>? isCustom,
    Expression<bool>? orderIsNew,
    Expression<int>? cartId,
    Expression<int>? productId,
    Expression<int>? orderId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (netPrice != null) 'net_price': netPrice,
      if (isCustom != null) 'is_custom': isCustom,
      if (orderIsNew != null) 'order_is_new': orderIsNew,
      if (cartId != null) 'cart_id': cartId,
      if (productId != null) 'product_id': productId,
      if (orderId != null) 'order_id': orderId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NewOrderItemsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? sku,
      Value<String?>? description,
      Value<double>? price,
      Value<double?>? discount,
      Value<String?>? discountType,
      Value<double>? netPrice,
      Value<bool>? isCustom,
      Value<bool>? orderIsNew,
      Value<int?>? cartId,
      Value<int?>? productId,
      Value<int>? orderId,
      Value<DateTime>? createdAt}) {
    return NewOrderItemsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      description: description ?? this.description,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      netPrice: netPrice ?? this.netPrice,
      isCustom: isCustom ?? this.isCustom,
      orderIsNew: orderIsNew ?? this.orderIsNew,
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      orderId: orderId ?? this.orderId,
      createdAt: createdAt ?? this.createdAt,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (netPrice.present) {
      map['net_price'] = Variable<double>(netPrice.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (orderIsNew.present) {
      map['order_is_new'] = Variable<bool>(orderIsNew.value);
    }
    if (cartId.present) {
      map['cart_id'] = Variable<int>(cartId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewOrderItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('netPrice: $netPrice, ')
          ..write('isCustom: $isCustom, ')
          ..write('orderIsNew: $orderIsNew, ')
          ..write('cartId: $cartId, ')
          ..write('productId: $productId, ')
          ..write('orderId: $orderId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NewOrderPaymentsTableTable extends NewOrderPaymentsTable
    with TableInfo<$NewOrderPaymentsTableTable, OrderPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewOrderPaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES orders (id) ON DELETE CASCADE'));
  static const VerificationMeta _paymentMethodIdMeta =
      const VerificationMeta('paymentMethodId');
  @override
  late final GeneratedColumn<int> paymentMethodId = GeneratedColumn<int>(
      'payment_method_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES payment_methods (id) ON DELETE SET NULL'));
  static const VerificationMeta _orderIsNewMeta =
      const VerificationMeta('orderIsNew');
  @override
  late final GeneratedColumn<bool> orderIsNew = GeneratedColumn<bool>(
      'order_is_new', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("order_is_new" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, orderId, paymentMethodId, orderIsNew, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'new_order_payments';
  @override
  VerificationContext validateIntegrity(Insertable<OrderPayment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('payment_method_id')) {
      context.handle(
          _paymentMethodIdMeta,
          paymentMethodId.isAcceptableOrUnknown(
              data['payment_method_id']!, _paymentMethodIdMeta));
    }
    if (data.containsKey('order_is_new')) {
      context.handle(
          _orderIsNewMeta,
          orderIsNew.isAcceptableOrUnknown(
              data['order_is_new']!, _orderIsNewMeta));
    } else if (isInserting) {
      context.missing(_orderIsNewMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderPayment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      paymentMethodId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_method_id']),
      orderIsNew: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}order_is_new'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NewOrderPaymentsTableTable createAlias(String alias) {
    return $NewOrderPaymentsTableTable(attachedDatabase, alias);
  }
}

class NewOrderPaymentsTableCompanion extends UpdateCompanion<OrderPayment> {
  final Value<int> id;
  final Value<double> amount;
  final Value<int> orderId;
  final Value<int?> paymentMethodId;
  final Value<bool> orderIsNew;
  final Value<DateTime> createdAt;
  const NewOrderPaymentsTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.orderId = const Value.absent(),
    this.paymentMethodId = const Value.absent(),
    this.orderIsNew = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NewOrderPaymentsTableCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required int orderId,
    this.paymentMethodId = const Value.absent(),
    required bool orderIsNew,
    required DateTime createdAt,
  })  : amount = Value(amount),
        orderId = Value(orderId),
        orderIsNew = Value(orderIsNew),
        createdAt = Value(createdAt);
  static Insertable<OrderPayment> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<int>? orderId,
    Expression<int>? paymentMethodId,
    Expression<bool>? orderIsNew,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (orderId != null) 'order_id': orderId,
      if (paymentMethodId != null) 'payment_method_id': paymentMethodId,
      if (orderIsNew != null) 'order_is_new': orderIsNew,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NewOrderPaymentsTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<int>? orderId,
      Value<int?>? paymentMethodId,
      Value<bool>? orderIsNew,
      Value<DateTime>? createdAt}) {
    return NewOrderPaymentsTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      orderId: orderId ?? this.orderId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      orderIsNew: orderIsNew ?? this.orderIsNew,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (paymentMethodId.present) {
      map['payment_method_id'] = Variable<int>(paymentMethodId.value);
    }
    if (orderIsNew.present) {
      map['order_is_new'] = Variable<bool>(orderIsNew.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewOrderPaymentsTableCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('orderId: $orderId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('orderIsNew: $orderIsNew, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NewOrdersTableTable extends NewOrdersTable
    with TableInfo<$NewOrdersTableTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewOrdersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isStfMeta = const VerificationMeta('isStf');
  @override
  late final GeneratedColumn<bool> isStf = GeneratedColumn<bool>(
      'is_stf', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_stf" IN (0, 1))'));
  static const VerificationMeta _isUtfMeta = const VerificationMeta('isUtf');
  @override
  late final GeneratedColumn<bool> isUtf = GeneratedColumn<bool>(
      'is_utf', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_utf" IN (0, 1))'));
  static const VerificationMeta _eReceiptMeta =
      const VerificationMeta('eReceipt');
  @override
  late final GeneratedColumn<bool> eReceipt = GeneratedColumn<bool>(
      'e_receipt', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("e_receipt" IN (0, 1))'));
  static const VerificationMeta _salesNoteMeta =
      const VerificationMeta('salesNote');
  @override
  late final GeneratedColumn<String> salesNote = GeneratedColumn<String>(
      'sales_note', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _invoiceNoMeta =
      const VerificationMeta('invoiceNo');
  @override
  late final GeneratedColumn<String> invoiceNo = GeneratedColumn<String>(
      'invoice_no', aliasedName, false,
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
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumnWithTypeConverter<DiscountType?, String>
      discountType = GeneratedColumn<String>('discount_type', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<DiscountType?>(
              $NewOrdersTableTable.$converterdiscountTypen);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _extrasTotalMeta =
      const VerificationMeta('extrasTotal');
  @override
  late final GeneratedColumn<double> extrasTotal = GeneratedColumn<double>(
      'extras_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netTotalMeta =
      const VerificationMeta('netTotal');
  @override
  late final GeneratedColumn<double> netTotal = GeneratedColumn<double>(
      'net_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _roundingMeta =
      const VerificationMeta('rounding');
  @override
  late final GeneratedColumn<double> rounding = GeneratedColumn<double>(
      'rounding', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _screeningIdMeta =
      const VerificationMeta('screeningId');
  @override
  late final GeneratedColumn<int> screeningId = GeneratedColumn<int>(
      'screening_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES screenings (id) ON DELETE CASCADE'));
  static const VerificationMeta _customerNricMeta =
      const VerificationMeta('customerNric');
  @override
  late final GeneratedColumn<String> customerNric = GeneratedColumn<String>(
      'customer_nric', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES customers (nric) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        isStf,
        isUtf,
        eReceipt,
        salesNote,
        invoiceNo,
        invoicePrefix,
        discount,
        discountType,
        subtotal,
        extrasTotal,
        netTotal,
        rounding,
        screeningId,
        customerNric,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'new_orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_stf')) {
      context.handle(
          _isStfMeta, isStf.isAcceptableOrUnknown(data['is_stf']!, _isStfMeta));
    } else if (isInserting) {
      context.missing(_isStfMeta);
    }
    if (data.containsKey('is_utf')) {
      context.handle(
          _isUtfMeta, isUtf.isAcceptableOrUnknown(data['is_utf']!, _isUtfMeta));
    } else if (isInserting) {
      context.missing(_isUtfMeta);
    }
    if (data.containsKey('e_receipt')) {
      context.handle(_eReceiptMeta,
          eReceipt.isAcceptableOrUnknown(data['e_receipt']!, _eReceiptMeta));
    } else if (isInserting) {
      context.missing(_eReceiptMeta);
    }
    if (data.containsKey('sales_note')) {
      context.handle(_salesNoteMeta,
          salesNote.isAcceptableOrUnknown(data['sales_note']!, _salesNoteMeta));
    }
    if (data.containsKey('invoice_no')) {
      context.handle(_invoiceNoMeta,
          invoiceNo.isAcceptableOrUnknown(data['invoice_no']!, _invoiceNoMeta));
    } else if (isInserting) {
      context.missing(_invoiceNoMeta);
    }
    if (data.containsKey('invoice_prefix')) {
      context.handle(
          _invoicePrefixMeta,
          invoicePrefix.isAcceptableOrUnknown(
              data['invoice_prefix']!, _invoicePrefixMeta));
    } else if (isInserting) {
      context.missing(_invoicePrefixMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    context.handle(_discountTypeMeta, const VerificationResult.success());
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('extras_total')) {
      context.handle(
          _extrasTotalMeta,
          extrasTotal.isAcceptableOrUnknown(
              data['extras_total']!, _extrasTotalMeta));
    } else if (isInserting) {
      context.missing(_extrasTotalMeta);
    }
    if (data.containsKey('net_total')) {
      context.handle(_netTotalMeta,
          netTotal.isAcceptableOrUnknown(data['net_total']!, _netTotalMeta));
    } else if (isInserting) {
      context.missing(_netTotalMeta);
    }
    if (data.containsKey('rounding')) {
      context.handle(_roundingMeta,
          rounding.isAcceptableOrUnknown(data['rounding']!, _roundingMeta));
    }
    if (data.containsKey('screening_id')) {
      context.handle(
          _screeningIdMeta,
          screeningId.isAcceptableOrUnknown(
              data['screening_id']!, _screeningIdMeta));
    } else if (isInserting) {
      context.missing(_screeningIdMeta);
    }
    if (data.containsKey('customer_nric')) {
      context.handle(
          _customerNricMeta,
          customerNric.isAcceptableOrUnknown(
              data['customer_nric']!, _customerNricMeta));
    } else if (isInserting) {
      context.missing(_customerNricMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isStf: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_stf'])!,
      isUtf: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_utf'])!,
      eReceipt: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}e_receipt'])!,
      salesNote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sales_note']),
      invoiceNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_no'])!,
      invoicePrefix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_prefix'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount']),
      discountType: $NewOrdersTableTable.$converterdiscountTypen.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}discount_type'])),
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      extrasTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}extras_total'])!,
      netTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_total'])!,
      rounding: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rounding']),
      screeningId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}screening_id'])!,
      customerNric: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_nric'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NewOrdersTableTable createAlias(String alias) {
    return $NewOrdersTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DiscountType, String, String>
      $converterdiscountType =
      const EnumNameConverter<DiscountType>(DiscountType.values);
  static JsonTypeConverter2<DiscountType?, String?, String?>
      $converterdiscountTypen =
      JsonTypeConverter2.asNullable($converterdiscountType);
}

class NewOrdersTableCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<bool> isStf;
  final Value<bool> isUtf;
  final Value<bool> eReceipt;
  final Value<String?> salesNote;
  final Value<String> invoiceNo;
  final Value<String> invoicePrefix;
  final Value<double?> discount;
  final Value<DiscountType?> discountType;
  final Value<double> subtotal;
  final Value<double> extrasTotal;
  final Value<double> netTotal;
  final Value<double?> rounding;
  final Value<int> screeningId;
  final Value<String> customerNric;
  final Value<DateTime> createdAt;
  const NewOrdersTableCompanion({
    this.id = const Value.absent(),
    this.isStf = const Value.absent(),
    this.isUtf = const Value.absent(),
    this.eReceipt = const Value.absent(),
    this.salesNote = const Value.absent(),
    this.invoiceNo = const Value.absent(),
    this.invoicePrefix = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.extrasTotal = const Value.absent(),
    this.netTotal = const Value.absent(),
    this.rounding = const Value.absent(),
    this.screeningId = const Value.absent(),
    this.customerNric = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NewOrdersTableCompanion.insert({
    this.id = const Value.absent(),
    required bool isStf,
    required bool isUtf,
    required bool eReceipt,
    this.salesNote = const Value.absent(),
    required String invoiceNo,
    required String invoicePrefix,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    required double subtotal,
    required double extrasTotal,
    required double netTotal,
    this.rounding = const Value.absent(),
    required int screeningId,
    required String customerNric,
    required DateTime createdAt,
  })  : isStf = Value(isStf),
        isUtf = Value(isUtf),
        eReceipt = Value(eReceipt),
        invoiceNo = Value(invoiceNo),
        invoicePrefix = Value(invoicePrefix),
        subtotal = Value(subtotal),
        extrasTotal = Value(extrasTotal),
        netTotal = Value(netTotal),
        screeningId = Value(screeningId),
        customerNric = Value(customerNric),
        createdAt = Value(createdAt);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<bool>? isStf,
    Expression<bool>? isUtf,
    Expression<bool>? eReceipt,
    Expression<String>? salesNote,
    Expression<String>? invoiceNo,
    Expression<String>? invoicePrefix,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? subtotal,
    Expression<double>? extrasTotal,
    Expression<double>? netTotal,
    Expression<double>? rounding,
    Expression<int>? screeningId,
    Expression<String>? customerNric,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isStf != null) 'is_stf': isStf,
      if (isUtf != null) 'is_utf': isUtf,
      if (eReceipt != null) 'e_receipt': eReceipt,
      if (salesNote != null) 'sales_note': salesNote,
      if (invoiceNo != null) 'invoice_no': invoiceNo,
      if (invoicePrefix != null) 'invoice_prefix': invoicePrefix,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (subtotal != null) 'subtotal': subtotal,
      if (extrasTotal != null) 'extras_total': extrasTotal,
      if (netTotal != null) 'net_total': netTotal,
      if (rounding != null) 'rounding': rounding,
      if (screeningId != null) 'screening_id': screeningId,
      if (customerNric != null) 'customer_nric': customerNric,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NewOrdersTableCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isStf,
      Value<bool>? isUtf,
      Value<bool>? eReceipt,
      Value<String?>? salesNote,
      Value<String>? invoiceNo,
      Value<String>? invoicePrefix,
      Value<double?>? discount,
      Value<DiscountType?>? discountType,
      Value<double>? subtotal,
      Value<double>? extrasTotal,
      Value<double>? netTotal,
      Value<double?>? rounding,
      Value<int>? screeningId,
      Value<String>? customerNric,
      Value<DateTime>? createdAt}) {
    return NewOrdersTableCompanion(
      id: id ?? this.id,
      isStf: isStf ?? this.isStf,
      isUtf: isUtf ?? this.isUtf,
      eReceipt: eReceipt ?? this.eReceipt,
      salesNote: salesNote ?? this.salesNote,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      invoicePrefix: invoicePrefix ?? this.invoicePrefix,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      subtotal: subtotal ?? this.subtotal,
      extrasTotal: extrasTotal ?? this.extrasTotal,
      netTotal: netTotal ?? this.netTotal,
      rounding: rounding ?? this.rounding,
      screeningId: screeningId ?? this.screeningId,
      customerNric: customerNric ?? this.customerNric,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isStf.present) {
      map['is_stf'] = Variable<bool>(isStf.value);
    }
    if (isUtf.present) {
      map['is_utf'] = Variable<bool>(isUtf.value);
    }
    if (eReceipt.present) {
      map['e_receipt'] = Variable<bool>(eReceipt.value);
    }
    if (salesNote.present) {
      map['sales_note'] = Variable<String>(salesNote.value);
    }
    if (invoiceNo.present) {
      map['invoice_no'] = Variable<String>(invoiceNo.value);
    }
    if (invoicePrefix.present) {
      map['invoice_prefix'] = Variable<String>(invoicePrefix.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>($NewOrdersTableTable
          .$converterdiscountTypen
          .toSql(discountType.value));
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (extrasTotal.present) {
      map['extras_total'] = Variable<double>(extrasTotal.value);
    }
    if (netTotal.present) {
      map['net_total'] = Variable<double>(netTotal.value);
    }
    if (rounding.present) {
      map['rounding'] = Variable<double>(rounding.value);
    }
    if (screeningId.present) {
      map['screening_id'] = Variable<int>(screeningId.value);
    }
    if (customerNric.present) {
      map['customer_nric'] = Variable<String>(customerNric.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewOrdersTableCompanion(')
          ..write('id: $id, ')
          ..write('isStf: $isStf, ')
          ..write('isUtf: $isUtf, ')
          ..write('eReceipt: $eReceipt, ')
          ..write('salesNote: $salesNote, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('invoicePrefix: $invoicePrefix, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('subtotal: $subtotal, ')
          ..write('extrasTotal: $extrasTotal, ')
          ..write('netTotal: $netTotal, ')
          ..write('rounding: $rounding, ')
          ..write('screeningId: $screeningId, ')
          ..write('customerNric: $customerNric, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NewScreeningRegistrationsTableTable
    extends NewScreeningRegistrationsTable
    with
        TableInfo<$NewScreeningRegistrationsTableTable, ScreeningRegistration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewScreeningRegistrationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<String> index = GeneratedColumn<String>(
      'index', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerNricMeta =
      const VerificationMeta('customerNric');
  @override
  late final GeneratedColumn<String> customerNric = GeneratedColumn<String>(
      'customer_nric', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timeslotIdMeta =
      const VerificationMeta('timeslotId');
  @override
  late final GeneratedColumn<int> timeslotId = GeneratedColumn<int>(
      'timeslot_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES screening_timeslots (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, index, customerNric, timeslotId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'new_screening_registrations';
  @override
  VerificationContext validateIntegrity(
      Insertable<ScreeningRegistration> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    }
    if (data.containsKey('customer_nric')) {
      context.handle(
          _customerNricMeta,
          customerNric.isAcceptableOrUnknown(
              data['customer_nric']!, _customerNricMeta));
    }
    if (data.containsKey('timeslot_id')) {
      context.handle(
          _timeslotIdMeta,
          timeslotId.isAcceptableOrUnknown(
              data['timeslot_id']!, _timeslotIdMeta));
    } else if (isInserting) {
      context.missing(_timeslotIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScreeningRegistration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreeningRegistration(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}index']),
      customerNric: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_nric']),
      timeslotId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timeslot_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NewScreeningRegistrationsTableTable createAlias(String alias) {
    return $NewScreeningRegistrationsTableTable(attachedDatabase, alias);
  }
}

class NewScreeningRegistrationsTableCompanion
    extends UpdateCompanion<ScreeningRegistration> {
  final Value<int> id;
  final Value<String?> index;
  final Value<String?> customerNric;
  final Value<int> timeslotId;
  final Value<DateTime> createdAt;
  const NewScreeningRegistrationsTableCompanion({
    this.id = const Value.absent(),
    this.index = const Value.absent(),
    this.customerNric = const Value.absent(),
    this.timeslotId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NewScreeningRegistrationsTableCompanion.insert({
    this.id = const Value.absent(),
    this.index = const Value.absent(),
    this.customerNric = const Value.absent(),
    required int timeslotId,
    required DateTime createdAt,
  })  : timeslotId = Value(timeslotId),
        createdAt = Value(createdAt);
  static Insertable<ScreeningRegistration> custom({
    Expression<int>? id,
    Expression<String>? index,
    Expression<String>? customerNric,
    Expression<int>? timeslotId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (index != null) 'index': index,
      if (customerNric != null) 'customer_nric': customerNric,
      if (timeslotId != null) 'timeslot_id': timeslotId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NewScreeningRegistrationsTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? index,
      Value<String?>? customerNric,
      Value<int>? timeslotId,
      Value<DateTime>? createdAt}) {
    return NewScreeningRegistrationsTableCompanion(
      id: id ?? this.id,
      index: index ?? this.index,
      customerNric: customerNric ?? this.customerNric,
      timeslotId: timeslotId ?? this.timeslotId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (index.present) {
      map['index'] = Variable<String>(index.value);
    }
    if (customerNric.present) {
      map['customer_nric'] = Variable<String>(customerNric.value);
    }
    if (timeslotId.present) {
      map['timeslot_id'] = Variable<int>(timeslotId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewScreeningRegistrationsTableCompanion(')
          ..write('id: $id, ')
          ..write('index: $index, ')
          ..write('customerNric: $customerNric, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ToSyncDataTableTable extends ToSyncDataTable
    with TableInfo<$ToSyncDataTableTable, ToSyncData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToSyncDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumnWithTypeConverter<ToSyncModels, String> model =
      GeneratedColumn<String>('model', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ToSyncModels>($ToSyncDataTableTable.$convertermodel);
  static const VerificationMeta _modelIdMeta =
      const VerificationMeta('modelId');
  @override
  late final GeneratedColumn<int> modelId = GeneratedColumn<int>(
      'model_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumnWithTypeConverter<ToSyncActions, String> action =
      GeneratedColumn<String>('action', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ToSyncActions>($ToSyncDataTableTable.$converteraction);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      value = GeneratedColumn<String>('value', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $ToSyncDataTableTable.$convertervalue);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, model, modelId, action, value, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'to_sync_data';
  @override
  VerificationContext validateIntegrity(Insertable<ToSyncData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_modelMeta, const VerificationResult.success());
    if (data.containsKey('model_id')) {
      context.handle(_modelIdMeta,
          modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta));
    } else if (isInserting) {
      context.missing(_modelIdMeta);
    }
    context.handle(_actionMeta, const VerificationResult.success());
    context.handle(_valueMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToSyncData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToSyncData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      model: $ToSyncDataTableTable.$convertermodel.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model'])!),
      modelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}model_id'])!,
      action: $ToSyncDataTableTable.$converteraction.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      value: $ToSyncDataTableTable.$convertervalue.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!),
    );
  }

  @override
  $ToSyncDataTableTable createAlias(String alias) {
    return $ToSyncDataTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ToSyncModels, String, String> $convertermodel =
      const EnumNameConverter<ToSyncModels>(ToSyncModels.values);
  static JsonTypeConverter2<ToSyncActions, String, String> $converteraction =
      const EnumNameConverter<ToSyncActions>(ToSyncActions.values);
  static TypeConverter<Map<String, dynamic>, String> $convertervalue =
      const JsonConverter();
}

class ToSyncDataTableCompanion extends UpdateCompanion<ToSyncData> {
  final Value<int> id;
  final Value<ToSyncModels> model;
  final Value<int> modelId;
  final Value<ToSyncActions> action;
  final Value<Map<String, dynamic>> value;
  final Value<DateTime> createdAt;
  const ToSyncDataTableCompanion({
    this.id = const Value.absent(),
    this.model = const Value.absent(),
    this.modelId = const Value.absent(),
    this.action = const Value.absent(),
    this.value = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ToSyncDataTableCompanion.insert({
    this.id = const Value.absent(),
    required ToSyncModels model,
    required int modelId,
    required ToSyncActions action,
    required Map<String, dynamic> value,
    required DateTime createdAt,
  })  : model = Value(model),
        modelId = Value(modelId),
        action = Value(action),
        value = Value(value),
        createdAt = Value(createdAt);
  static Insertable<ToSyncData> custom({
    Expression<int>? id,
    Expression<String>? model,
    Expression<int>? modelId,
    Expression<String>? action,
    Expression<String>? value,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (model != null) 'model': model,
      if (modelId != null) 'model_id': modelId,
      if (action != null) 'action': action,
      if (value != null) 'value': value,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ToSyncDataTableCompanion copyWith(
      {Value<int>? id,
      Value<ToSyncModels>? model,
      Value<int>? modelId,
      Value<ToSyncActions>? action,
      Value<Map<String, dynamic>>? value,
      Value<DateTime>? createdAt}) {
    return ToSyncDataTableCompanion(
      id: id ?? this.id,
      model: model ?? this.model,
      modelId: modelId ?? this.modelId,
      action: action ?? this.action,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(
          $ToSyncDataTableTable.$convertermodel.toSql(model.value));
    }
    if (modelId.present) {
      map['model_id'] = Variable<int>(modelId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(
          $ToSyncDataTableTable.$converteraction.toSql(action.value));
    }
    if (value.present) {
      map['value'] = Variable<String>(
          $ToSyncDataTableTable.$convertervalue.toSql(value.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToSyncDataTableCompanion(')
          ..write('id: $id, ')
          ..write('model: $model, ')
          ..write('modelId: $modelId, ')
          ..write('action: $action, ')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt')
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
  late final $ScreeningTimeslotsTableTable screeningTimeslotsTable =
      $ScreeningTimeslotsTableTable(this);
  late final $ScreeningRegistrationsTableTable screeningRegistrationsTable =
      $ScreeningRegistrationsTableTable(this);
  late final $OrdersTableTable ordersTable = $OrdersTableTable(this);
  late final $OrderItemsTableTable orderItemsTable =
      $OrderItemsTableTable(this);
  late final $OrderExtrasTableTable orderExtrasTable =
      $OrderExtrasTableTable(this);
  late final $OrderPaymentsTableTable orderPaymentsTable =
      $OrderPaymentsTableTable(this);
  late final $NewCustomersTableTable newCustomersTable =
      $NewCustomersTableTable(this);
  late final $NewOrderExtrasTableTable newOrderExtrasTable =
      $NewOrderExtrasTableTable(this);
  late final $NewOrderItemsTableTable newOrderItemsTable =
      $NewOrderItemsTableTable(this);
  late final $NewOrderPaymentsTableTable newOrderPaymentsTable =
      $NewOrderPaymentsTableTable(this);
  late final $NewOrdersTableTable newOrdersTable = $NewOrdersTableTable(this);
  late final $NewScreeningRegistrationsTableTable
      newScreeningRegistrationsTable =
      $NewScreeningRegistrationsTableTable(this);
  late final $ToSyncDataTableTable toSyncDataTable =
      $ToSyncDataTableTable(this);
  late final Index usersId =
      Index('users_id', 'CREATE UNIQUE INDEX users_id ON users (id)');
  late final Index posLicensesId = Index('pos_licenses_id',
      'CREATE UNIQUE INDEX pos_licenses_id ON pos_licenses (id)');
  late final Index companyId =
      Index('company_id', 'CREATE UNIQUE INDEX company_id ON company (id)');
  late final Index receiptSettingsId = Index('receipt_settings_id',
      'CREATE UNIQUE INDEX receipt_settings_id ON receipt_settings (id)');
  late final Index posExtrasId = Index(
      'pos_extras_id', 'CREATE UNIQUE INDEX pos_extras_id ON pos_extras (id)');
  late final Index paymentMethodsId = Index('payment_methods_id',
      'CREATE UNIQUE INDEX payment_methods_id ON payment_methods (id)');
  late final Index productCategoriesId = Index('product_categories_id',
      'CREATE UNIQUE INDEX product_categories_id ON product_categories (id)');
  late final Index productsId =
      Index('products_id', 'CREATE UNIQUE INDEX products_id ON products (id)');
  late final Index productsSku =
      Index('products_sku', 'CREATE INDEX products_sku ON products (sku)');
  late final Index productsCategoryId = Index('products_category_id',
      'CREATE INDEX products_category_id ON products (category_id)');
  late final Index customersId = Index(
      'customers_id', 'CREATE UNIQUE INDEX customers_id ON customers (id)');
  late final Index customersFullName = Index('customers_full_name',
      'CREATE INDEX customers_full_name ON customers (full_name)');
  late final Index customersNric = Index(
      'customers_nric', 'CREATE INDEX customers_nric ON customers (nric)');
  late final Index customersMobileNo = Index('customers_mobile_no',
      'CREATE INDEX customers_mobile_no ON customers (mobile_no)');
  late final Index screeningsId = Index(
      'screenings_id', 'CREATE UNIQUE INDEX screenings_id ON screenings (id)');
  late final Index screeningVenuesId = Index('screening_venues_id',
      'CREATE UNIQUE INDEX screening_venues_id ON screening_venues (id)');
  late final Index screeningVenuesScreeningFormId = Index(
      'screening_venues_screening_form_id',
      'CREATE INDEX screening_venues_screening_form_id ON screening_venues (screening_form_id)');
  late final Index screeningTimeslotsId = Index('screening_timeslots_id',
      'CREATE UNIQUE INDEX screening_timeslots_id ON screening_timeslots (id)');
  late final Index screeningTimeslotsScreeningId = Index(
      'screening_timeslots_screening_id',
      'CREATE INDEX screening_timeslots_screening_id ON screening_timeslots (screening_id)');
  late final Index screeningTimeslotsVenueId = Index(
      'screening_timeslots_venue_id',
      'CREATE INDEX screening_timeslots_venue_id ON screening_timeslots (venue_id)');
  late final Index screeningRegistrationsIndex = Index(
      'screening_registrations_index',
      'CREATE INDEX screening_registrations_index ON screening_registrations ("index")');
  late final Index screeningRegistrationsCustomerId = Index(
      'screening_registrations_customer_id',
      'CREATE INDEX screening_registrations_customer_id ON screening_registrations (customer_id)');
  late final Index screeningRegistrationsTimeslotId = Index(
      'screening_registrations_timeslot_id',
      'CREATE INDEX screening_registrations_timeslot_id ON screening_registrations (timeslot_id)');
  late final Index ordersId =
      Index('orders_id', 'CREATE UNIQUE INDEX orders_id ON orders (id)');
  late final Index ordersLicenseId = Index('orders_license_id',
      'CREATE INDEX orders_license_id ON orders (license_id)');
  late final Index ordersScreeningId = Index('orders_screening_id',
      'CREATE INDEX orders_screening_id ON orders (screening_id)');
  late final Index ordersCustomerId = Index('orders_customer_id',
      'CREATE INDEX orders_customer_id ON orders (customer_id)');
  late final Index orderItemsId = Index('order_items_id',
      'CREATE UNIQUE INDEX order_items_id ON order_items (id)');
  late final Index orderItemsName = Index('order_items_name',
      'CREATE INDEX order_items_name ON order_items (name)');
  late final Index orderItemsSku = Index(
      'order_items_sku', 'CREATE INDEX order_items_sku ON order_items (sku)');
  late final Index orderItemsCartId = Index('order_items_cart_id',
      'CREATE INDEX order_items_cart_id ON order_items (cart_id)');
  late final Index orderItemsProductId = Index('order_items_product_id',
      'CREATE INDEX order_items_product_id ON order_items (product_id)');
  late final Index orderItemsOrderId = Index('order_items_order_id',
      'CREATE INDEX order_items_order_id ON order_items (order_id)');
  late final Index orderExtrasId = Index('order_extras_id',
      'CREATE UNIQUE INDEX order_extras_id ON order_extras (id)');
  late final Index orderExtrasExtraId = Index('order_extras_extra_id',
      'CREATE INDEX order_extras_extra_id ON order_extras (extra_id)');
  late final Index orderExtrasOrderId = Index('order_extras_order_id',
      'CREATE INDEX order_extras_order_id ON order_extras (order_id)');
  late final Index orderPaymentsId = Index('order_payments_id',
      'CREATE UNIQUE INDEX order_payments_id ON order_payments (id)');
  late final Index orderPaymentsOrderId = Index('order_payments_order_id',
      'CREATE INDEX order_payments_order_id ON order_payments (order_id)');
  late final Index orderPaymentsPaymentMethodId = Index(
      'order_payments_payment_method_id',
      'CREATE INDEX order_payments_payment_method_id ON order_payments (payment_method_id)');
  late final Index newCustomersId = Index('new_customers_id',
      'CREATE UNIQUE INDEX new_customers_id ON new_customers (id)');
  late final Index newCustomersFullName = Index('new_customers_full_name',
      'CREATE INDEX new_customers_full_name ON new_customers (full_name)');
  late final Index newCustomersNric = Index('new_customers_nric',
      'CREATE INDEX new_customers_nric ON new_customers (nric)');
  late final Index newCustomersMobileNo = Index('new_customers_mobile_no',
      'CREATE INDEX new_customers_mobile_no ON new_customers (mobile_no)');
  late final Index newOrderExtrasId = Index('new_order_extras_id',
      'CREATE UNIQUE INDEX new_order_extras_id ON new_order_extras (id)');
  late final Index newOrderExtrasExtraId = Index('new_order_extras_extra_id',
      'CREATE INDEX new_order_extras_extra_id ON new_order_extras (extra_id)');
  late final Index newOrderExtrasOrderId = Index('new_order_extras_order_id',
      'CREATE INDEX new_order_extras_order_id ON new_order_extras (order_id)');
  late final Index newOrderItemsId = Index('new_order_items_id',
      'CREATE UNIQUE INDEX new_order_items_id ON new_order_items (id)');
  late final Index newOrderItemsName = Index('new_order_items_name',
      'CREATE INDEX new_order_items_name ON new_order_items (name)');
  late final Index newOrderItemsSku = Index('new_order_items_sku',
      'CREATE INDEX new_order_items_sku ON new_order_items (sku)');
  late final Index newOrderItemsCartId = Index('new_order_items_cart_id',
      'CREATE INDEX new_order_items_cart_id ON new_order_items (cart_id)');
  late final Index newOrderItemsProductId = Index('new_order_items_product_id',
      'CREATE INDEX new_order_items_product_id ON new_order_items (product_id)');
  late final Index newOrderItemsOrderId = Index('new_order_items_order_id',
      'CREATE INDEX new_order_items_order_id ON new_order_items (order_id)');
  late final Index newOrderPaymentsId = Index('new_order_payments_id',
      'CREATE UNIQUE INDEX new_order_payments_id ON new_order_payments (id)');
  late final Index newOrderPaymentsOrderId = Index(
      'new_order_payments_order_id',
      'CREATE INDEX new_order_payments_order_id ON new_order_payments (order_id)');
  late final Index newOrderPaymentsPaymentMethodId = Index(
      'new_order_payments_payment_method_id',
      'CREATE INDEX new_order_payments_payment_method_id ON new_order_payments (payment_method_id)');
  late final Index newOrdersId = Index(
      'new_orders_id', 'CREATE UNIQUE INDEX new_orders_id ON new_orders (id)');
  late final Index newOrdersScreeningId = Index('new_orders_screening_id',
      'CREATE INDEX new_orders_screening_id ON new_orders (screening_id)');
  late final Index newOrdersCustomerNric = Index('new_orders_customer_nric',
      'CREATE INDEX new_orders_customer_nric ON new_orders (customer_nric)');
  late final Index newScreeningRegistrationsId = Index(
      'new_screening_registrations_id',
      'CREATE UNIQUE INDEX new_screening_registrations_id ON new_screening_registrations (id)');
  late final Index newScreeningRegistrationsIndex = Index(
      'new_screening_registrations_index',
      'CREATE INDEX new_screening_registrations_index ON new_screening_registrations ("index")');
  late final Index newScreeningRegistrationsCustomerNric = Index(
      'new_screening_registrations_customer_nric',
      'CREATE INDEX new_screening_registrations_customer_nric ON new_screening_registrations (customer_nric)');
  late final Index newScreeningRegistrationsTimeslotId = Index(
      'new_screening_registrations_timeslot_id',
      'CREATE INDEX new_screening_registrations_timeslot_id ON new_screening_registrations (timeslot_id)');
  late final Index toSyncDataId = Index('to_sync_data_id',
      'CREATE UNIQUE INDEX to_sync_data_id ON to_sync_data (id)');
  late final Index toSyncDataModelId = Index('to_sync_data_model_id',
      'CREATE INDEX to_sync_data_model_id ON to_sync_data (model_id)');
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
  late final ScreeningTimeslotDao screeningTimeslotDao =
      ScreeningTimeslotDao(this as AppDb);
  late final ScreeningRegistrationDao screeningRegistrationDao =
      ScreeningRegistrationDao(this as AppDb);
  late final OrderDao orderDao = OrderDao(this as AppDb);
  late final OrderItemDao orderItemDao = OrderItemDao(this as AppDb);
  late final OrderExtraDao orderExtraDao = OrderExtraDao(this as AppDb);
  late final OrderPaymentDao orderPaymentDao = OrderPaymentDao(this as AppDb);
  late final ToSycnDataDao toSycnDataDao = ToSycnDataDao(this as AppDb);
  late final NewCustomerDao newCustomerDao = NewCustomerDao(this as AppDb);
  late final NewScreeningRegistrationDao newScreeningRegistrationDao =
      NewScreeningRegistrationDao(this as AppDb);
  late final NewOrderDao newOrderDao = NewOrderDao(this as AppDb);
  late final NewOrderItemDao newOrderItemDao = NewOrderItemDao(this as AppDb);
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
        screeningVenuesTable,
        screeningTimeslotsTable,
        screeningRegistrationsTable,
        ordersTable,
        orderItemsTable,
        orderExtrasTable,
        orderPaymentsTable,
        newCustomersTable,
        newOrderExtrasTable,
        newOrderItemsTable,
        newOrderPaymentsTable,
        newOrdersTable,
        newScreeningRegistrationsTable,
        toSyncDataTable,
        usersId,
        posLicensesId,
        companyId,
        receiptSettingsId,
        posExtrasId,
        paymentMethodsId,
        productCategoriesId,
        productsId,
        productsSku,
        productsCategoryId,
        customersId,
        customersFullName,
        customersNric,
        customersMobileNo,
        screeningsId,
        screeningVenuesId,
        screeningVenuesScreeningFormId,
        screeningTimeslotsId,
        screeningTimeslotsScreeningId,
        screeningTimeslotsVenueId,
        screeningRegistrationsIndex,
        screeningRegistrationsCustomerId,
        screeningRegistrationsTimeslotId,
        ordersId,
        ordersLicenseId,
        ordersScreeningId,
        ordersCustomerId,
        orderItemsId,
        orderItemsName,
        orderItemsSku,
        orderItemsCartId,
        orderItemsProductId,
        orderItemsOrderId,
        orderExtrasId,
        orderExtrasExtraId,
        orderExtrasOrderId,
        orderPaymentsId,
        orderPaymentsOrderId,
        orderPaymentsPaymentMethodId,
        newCustomersId,
        newCustomersFullName,
        newCustomersNric,
        newCustomersMobileNo,
        newOrderExtrasId,
        newOrderExtrasExtraId,
        newOrderExtrasOrderId,
        newOrderItemsId,
        newOrderItemsName,
        newOrderItemsSku,
        newOrderItemsCartId,
        newOrderItemsProductId,
        newOrderItemsOrderId,
        newOrderPaymentsId,
        newOrderPaymentsOrderId,
        newOrderPaymentsPaymentMethodId,
        newOrdersId,
        newOrdersScreeningId,
        newOrdersCustomerNric,
        newScreeningRegistrationsId,
        newScreeningRegistrationsIndex,
        newScreeningRegistrationsCustomerNric,
        newScreeningRegistrationsTimeslotId,
        toSyncDataId,
        toSyncDataModelId
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('screenings',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('screening_timeslots', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('screening_venues',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('screening_timeslots', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('customers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('screening_registrations', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('screening_timeslots',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('screening_registrations', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('screenings',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('orders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('customers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('orders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('products',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_items', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('orders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pos_extras',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_extras', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('orders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_extras', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('orders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_payments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('payment_methods',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_payments', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pos_extras',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_order_extras', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('orders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_order_extras', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('products',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_order_items', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('orders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_order_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('orders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_order_payments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('payment_methods',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_order_payments', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('screenings',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_orders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('customers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_orders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('screening_timeslots',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('new_screening_registrations',
                  kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDbHash() => r'b7d317fe4151971d9c6e1911fdde93a9ea541c18';

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

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
  static const VerificationMeta _accessTokenMeta =
      const VerificationMeta('accessToken');
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
      'access_token', aliasedName, false,
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
  List<GeneratedColumn> get $columns =>
      [id, fullName, accessToken, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
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
    if (data.containsKey('access_token')) {
      context.handle(
          _accessTokenMeta,
          accessToken.isAcceptableOrUnknown(
              data['access_token']!, _accessTokenMeta));
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
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
      accessToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}access_token'])!,
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
  final Value<String> accessToken;
  final Value<DateTime?> lastSyncedAt;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.accessToken = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String accessToken,
    this.lastSyncedAt = const Value.absent(),
  })  : fullName = Value(fullName),
        accessToken = Value(accessToken);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? accessToken,
    Expression<DateTime>? lastSyncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (accessToken != null) 'access_token': accessToken,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
    });
  }

  UsersTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String>? accessToken,
      Value<DateTime?>? lastSyncedAt}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      accessToken: accessToken ?? this.accessToken,
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
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
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
          ..write('accessToken: $accessToken, ')
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
  static const String $name = 'pos_licenses_table';
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
      'address', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _telephoneMeta =
      const VerificationMeta('telephone');
  @override
  late final GeneratedColumn<String> telephone = GeneratedColumn<String>(
      'telephone', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _faxMeta = const VerificationMeta('fax');
  @override
  late final GeneratedColumn<String> fax = GeneratedColumn<String>(
      'fax', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _coRegistrationNoMeta =
      const VerificationMeta('coRegistrationNo');
  @override
  late final GeneratedColumn<String> coRegistrationNo = GeneratedColumn<String>(
      'co_registration_no', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
  static const String $name = 'company_table';
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
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    } else if (isInserting) {
      context.missing(_postalCodeMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('telephone')) {
      context.handle(_telephoneMeta,
          telephone.isAcceptableOrUnknown(data['telephone']!, _telephoneMeta));
    } else if (isInserting) {
      context.missing(_telephoneMeta);
    }
    if (data.containsKey('fax')) {
      context.handle(
          _faxMeta, fax.isAcceptableOrUnknown(data['fax']!, _faxMeta));
    } else if (isInserting) {
      context.missing(_faxMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('co_registration_no')) {
      context.handle(
          _coRegistrationNoMeta,
          coRegistrationNo.isAcceptableOrUnknown(
              data['co_registration_no']!, _coRegistrationNoMeta));
    } else if (isInserting) {
      context.missing(_coRegistrationNoMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      telephone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telephone'])!,
      fax: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fax'])!,
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website'])!,
      coRegistrationNo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}co_registration_no'])!,
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
  final Value<String> address;
  final Value<String> postalCode;
  final Value<String> email;
  final Value<String> telephone;
  final Value<String> fax;
  final Value<String> website;
  final Value<String> coRegistrationNo;
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
    required String address,
    required String postalCode,
    required String email,
    required String telephone,
    required String fax,
    required String website,
    required String coRegistrationNo,
  })  : name = Value(name),
        address = Value(address),
        postalCode = Value(postalCode),
        email = Value(email),
        telephone = Value(telephone),
        fax = Value(fax),
        website = Value(website),
        coRegistrationNo = Value(coRegistrationNo);
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
      Value<String>? address,
      Value<String>? postalCode,
      Value<String>? email,
      Value<String>? telephone,
      Value<String>? fax,
      Value<String>? website,
      Value<String>? coRegistrationNo}) {
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

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $PosLicensesTableTable posLicensesTable =
      $PosLicensesTableTable(this);
  late final $CompanyTableTable companyTable = $CompanyTableTable(this);
  late final UserDao userDao = UserDao(this as AppDb);
  late final PosLicenseDao posLicenseDao = PosLicenseDao(this as AppDb);
  late final CompanyDao companyDao = CompanyDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [usersTable, posLicensesTable, companyTable];
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

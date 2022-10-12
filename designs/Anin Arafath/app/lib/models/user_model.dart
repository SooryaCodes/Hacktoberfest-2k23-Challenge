class User {
  User({
    this.id,
    this.email,
    this.token,
    this.personalInfo,
    this.profile,
  });

  final int? id;
  final String? email;
  final String? token;
  final bool? personalInfo;
  final Profile? profile;

  User copyWith({
    int? id,
    String? email,
    String? token,
    bool? personalInfo,
    Profile? profile,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        token: token ?? this.token,
        personalInfo: personalInfo ?? this.personalInfo,
        profile: profile ?? this.profile,
      );
}

class Profile {
  Profile({
    this.id,
    this.activeStatus,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.encoded,
    this.otp,
    this.otpVerified,
    this.gender,
    this.address,
    this.otpPhone,
    this.otpVerifiedPhone,
    this.image,
    this.country,
    this.city,
    this.state,
    this.dob,
    this.pin,
    this.status,
    this.isAdmin,
    this.isTeam,
    this.isCompany,
    this.aboutYou,
    this.employeeId,
    this.role,
    this.linkedinId,
    this.githubId,
    this.facebookId,
    this.isBookmarked,
    this.user,
  });

  final int? id;
  final bool? activeStatus;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic name;
  final String? encoded;
  final String? otp;
  final bool? otpVerified;
  final String? gender;
  final String? address;
  final dynamic otpPhone;
  final bool? otpVerifiedPhone;
  final dynamic image;
  final dynamic country;
  final dynamic city;
  final dynamic state;
  final dynamic dob;
  final dynamic pin;
  final String? status;
  final bool? isAdmin;
  final bool? isTeam;
  final bool? isCompany;
  final dynamic aboutYou;
  final dynamic employeeId;
  final dynamic role;
  final dynamic linkedinId;
  final dynamic githubId;
  final dynamic facebookId;
  final bool? isBookmarked;
  final int? user;

  Profile copyWith({
    int? id,
    bool? activeStatus,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic name,
    String? encoded,
    String? otp,
    bool? otpVerified,
    String? gender,
    String? address,
    dynamic otpPhone,
    bool? otpVerifiedPhone,
    dynamic image,
    dynamic country,
    dynamic city,
    dynamic state,
    dynamic dob,
    dynamic pin,
    String? status,
    bool? isAdmin,
    bool? isTeam,
    bool? isCompany,
    dynamic aboutYou,
    dynamic employeeId,
    dynamic role,
    dynamic linkedinId,
    dynamic githubId,
    dynamic facebookId,
    bool? isBookmarked,
    int? user,
  }) =>
      Profile(
        id: id ?? this.id,
        activeStatus: activeStatus ?? this.activeStatus,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        encoded: encoded ?? this.encoded,
        otp: otp ?? this.otp,
        otpVerified: otpVerified ?? this.otpVerified,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        otpPhone: otpPhone ?? this.otpPhone,
        otpVerifiedPhone: otpVerifiedPhone ?? this.otpVerifiedPhone,
        image: image ?? this.image,
        country: country ?? this.country,
        city: city ?? this.city,
        state: state ?? this.state,
        dob: dob ?? this.dob,
        pin: pin ?? this.pin,
        status: status ?? this.status,
        isAdmin: isAdmin ?? this.isAdmin,
        isTeam: isTeam ?? this.isTeam,
        isCompany: isCompany ?? this.isCompany,
        aboutYou: aboutYou ?? this.aboutYou,
        employeeId: employeeId ?? this.employeeId,
        role: role ?? this.role,
        linkedinId: linkedinId ?? this.linkedinId,
        githubId: githubId ?? this.githubId,
        facebookId: facebookId ?? this.facebookId,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        user: user ?? this.user,
      );
}

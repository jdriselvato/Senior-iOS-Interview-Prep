# UI Programming Live Class with John

## Preface

- content: *UI Programming*
	- Case Studies
		- build an instagram Ad layout
		- refactor Loans App
	- topic
		- architectural Patterns
		- DiffableDataSource
	- Common Interview Questions
		- App/View life-cycle
		- App Arch patterns
		- UI Design
		- User Inteaction / Events

## Course Intent

- increase success in iOS interviews
- Understand/recognize the general patterns
- Cover rear view items 
	- (what is this?)

# Case study 1: build an instagram ad layout

## Principles

- reusability
- no business logic in views
- consumer friendly
- clean / organized

### Interface builder vs programatic:

- XML is more difficult to debug merge conflicts
- program the example in one file if programmatic

### Ask questions - scoping

- what devices are we supporting
	- in this case; iphone
- are there plans to re-use this component elsewhere?
	- yes
- which views are dynamic?
- how will the api provide this information?
	- scoped out

### Tool Assessment

- autolayout constraints

### The Code

#### View

``` swift

class PostView: UIView {

	// add a viewModel

	private lazy var headerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private lazy var middleView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private lazy var footerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()


	private lazy var vStack: UIView {
		let view = UIStackView(
			arrangedSubviews: [headerView, middleView, footerView]
			)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.axis = .vertical
		view.alignment = .fill
		return view
	}()

	override init(frame: CGRect) {
		super.init(frame:.zero)
	}

	private func setupView() {
		self.addSubview(vStack)

		NSLayoutconstraint.activate([
			vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			vStack.topAnchor.constraint(equalTo: topAnchor),
			vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
			vStack.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}

// MARK: - Post Header View

class PostHeaderView: UIView {

	// Constants
	private struct Constants {
		static let imageViewSize: CGSize = CGSize(width: 50.0, height: 50.0)
		static let moreButtonSize: CGSize = CGSize(width: 30.0, height: 20.0)
	}

	// image
	private lazy var imageView: UIImageview = {
		let view = UIImageview()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	// title
	private lazy var titleLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	// sponsored
	private lazy var sponsoredLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private lazy var labelVStack: UIView {
		let view = UIStackView(
			arrangedSubviews: [titleLabel, sponsoredLabel]
			)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.axis = .vertical
		view.alignment = .fill
		return view
	}()

	// ... button
	private lazy var moreButton: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	private lazy var contentHVStack: UIView {
		let view = UIStackView(
			arrangedSubviews: [imageView, labelVStack, moreButton]
			)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.axis = .horizontal
		view.alignment = .fill
		return view
	}()

	private func setupView() {
		addSubview(contentHVStack)

		NSLayoutconstraint.activate([
			contentHVStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentHVStack.topAnchor.constraint(equalTo: topAnchor),
			contentHVStack.bottomAnchor.constraint(equalTo: bottomAnchor),
			contentHVStack.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}

```

#### ViewModel

```

```

#### ViewController

```

```